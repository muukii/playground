import UIKit

public final class DynamicAnimateTransaction : NSObject {

  public typealias Completion = () -> Void

  private let animator: UIDynamicAnimator

  private var completions: [Completion] = []

  private var behaviorBuffer: [UIDynamicBehavior] = []

  private var isRunning: Bool = false

  private var retainSelf: DynamicAnimateTransaction?

  public init(referenceView: UIView) {
    animator = UIDynamicAnimator(referenceView: referenceView)
    super.init()
    animator.delegate = self
  }

  deinit {
    print("deinit", self)
  }

  public func addBehavior(_ behavior: UIDynamicBehavior) {

    guard !isRunning else {
      animator.addBehavior(behavior)
      return
    }

    behaviorBuffer.append(behavior)
  }

  public func addBehavior(_ behaviors: [UIDynamicBehavior]) {

    guard !isRunning else {
      behaviors.forEach(animator.addBehavior)
      return
    }

    behaviors.forEach {
      behaviorBuffer.append($0)
    }
  }

  public func startAnimation() {

    behaviorBuffer.forEach {
      animator.addBehavior($0)
    }

    behaviorBuffer.removeAll()

    retainSelf = self
    addCompletion { [weak self] in
      self?.retainSelf = nil
    }
  }

  public func addCompletion(_ completion: @escaping Completion) {
    completions.append(completion)
  }
}

extension DynamicAnimateTransaction : UIDynamicAnimatorDelegate {

  public func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
    isRunning = true
  }

  public func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {

    isRunning = false

    completions.forEach {
      $0()
    }
  }
}
