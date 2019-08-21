
protocol SourceComponentType {
  
}

protocol StackType {
  associatedtype Element
  mutating func push(_ element: Element)
  mutating func pop() -> Element?
}

struct Stack<C : SourceComponentType> : StackType, Sequence {
  
  typealias Element = C
  
  typealias Iterator = Array<C>.Iterator
 
  private var backingStore: [C] = []
  
  init() {
    
  }
  
  mutating func push(_ element: Element) {
    backingStore.append(element)
  }
  
  mutating func pop() -> Element? {
    return backingStore.popLast()
  }
  
  mutating func removeAll() {
    backingStore.removeAll()
  }
  
  func makeIterator() -> IndexingIterator<Array<C>> {
    return backingStore.makeIterator()
  }
  
}

enum LikeSource : SourceComponentType {
  
}

Stack<LikeSource>()


