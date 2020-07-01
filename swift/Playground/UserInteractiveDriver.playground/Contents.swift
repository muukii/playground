import UIKit

public final class InteractiveTransactionDriver<PresentationContext: UIViewController, Transaction> {
  
  public struct Interaction {
    
    public typealias Props = (
      context: Context,
      presentationContext: PresentationContext,
      next: () -> Void,
      back: () -> Void,
      abort: () -> Void,
      error: (Swift.Error) -> Void
    )
    
    public typealias Action = (Props) -> Void
    
    private let interaction: Action
    
    public init(interaction: @escaping Action) {
      self.interaction = interaction
    }
    
    public func start(props: Props) {
      
      interaction(props)
    }
    
  }

  public final class Context {
    
    public private(set) var currentTransaction: Transaction
    
    init(currentTransaction: Transaction) {
      self.currentTransaction = currentTransaction
    }
    
    public func mutateTransaction(mutate: (inout Transaction) -> Void) {
      mutate(&currentTransaction)
    }
  }
  
  public final class Builder {
    
    fileprivate var orderedInteractions: [Interaction] = []
    
    private let _completion: () -> Void
    
    init(completion: @escaping () -> Void) {
      self._completion = completion
    }
    
    public func append(_ interaction: Interaction) {
      orderedInteractions.append(interaction)
    }
    
    public func complete() {
      _completion()
    }
  }
  
  private unowned let presentationContext: PresentationContext
  private var isRunning: Bool = false
  private let _makeTransaction: () -> Transaction
  private let interactions: [Interaction]
  
  // MARK: - Initializers
  
  public init(
    presentationContext: PresentationContext,
    makeTransaction: @escaping () -> Transaction,
    buildInteractions: @escaping (Builder) -> Void
    ) {
    
    self.presentationContext = presentationContext
    
    self._makeTransaction = makeTransaction
    self.interactions = builder.orderedInteractions
    
  }
  
  public func run(completion: @escaping (Result<Transaction, Swift.Error>) -> Void) {
    
    guard !isRunning else {
      // TODO:
      fatalError()
      return
    }
    
    isRunning = true
    
    let builder = Builder {
      
      let context = Context(currentTransaction: self._makeTransaction())
      
      self.start(
        interaction: interactions[0],
        index: 0,
        on: context,
        onFinish: {
          completion(.success(context.currentTransaction))
      },
        onAbort: { [weak self] in
          // TODO:
          self?.isRunning = false
        },
        onError: { error in
          completion(.failure(error))
      })
      
    }
    build(builder)
    
  }
  
  private func start(
    interactionIndex: Int,
    on context: Context,
    onFinish: @escaping () -> Void,
    onAbort: @escaping () -> Void,
    onError: @escaping (Swift.Error) -> Void
    ) {
    
    guard interactions.indices.contains(interactionIndex) else {
      
      if interactionIndex > 0 {
        onFinish()
        return
      }
      
      return
    }
    
    let interaction = interactions[interactionIndex]
    
    start(
      interaction: interaction,
      index: interactionIndex,
      on: context,
      onFinish: onFinish,
      onAbort: onAbort,
      onError: onError
    )
    
  }
  
  private func start(
    interaction: Interaction,
    index: Int,
    on context: Context,
    onFinish: @escaping () -> Void,
    onAbort: @escaping () -> Void,
    onError: @escaping (Swift.Error) -> Void
    ) {
    
    let interaction = interactions[index]
    
    interaction.start(props: (
      context: context,
      presentationContext: presentationContext,
      next: { [weak self] in
        self?.start(
          interactionIndex: index.advanced(by: 1),
          on: context,
          onFinish: onFinish,
          onAbort: onAbort,
          onError: onError
        )
    },
      back: { [weak self] in
        self?.start(
          interactionIndex: index.advanced(by: -1),
          on: context,
          onFinish: onFinish,
          onAbort: onAbort,
          onError: onError
        )
    },
      abort: {
        
        onAbort()
    },
      error: { error in
        
        onError(error)
    }
    ))
    
  }
  
}

//class MyViewController: UIViewController {}
//
//struct Transaction {
//  var count: Int = 0
//}
//
//let driver = InteractiveTransactionDriver<MyViewController, Transaction>(
//  presentationContext: MyViewController(),
//  makeTransaction: { .init() },
//  build: { (builder) in
//
//    // Declare flow
//    builder.append(.init { props in
//      props.next()
//    })
//
//})
