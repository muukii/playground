
public final class Filter<T> {
  
  private var old: T?
  private let comparer: (T, T) -> Bool
  
  public init(comparer: @escaping (T, T) -> Bool) {
    self.comparer = comparer
  }
  
  func runIfChanged(_ value: T, _ task: (T) -> Void) {
    guard let _old = old else {
      old = value
      task(value)
      return
    }
    
    guard !comparer(_old, value) else {
      return
    }
    
    task(value)
    old = value
  }
  
}

let f = Filter<String>(comparer: ==)

f.runIfChanged("a", { print("Hey", $0) })

f.runIfChanged("a", { print("Hey", $0) })

f.runIfChanged("b", { print("Hey", $0) })

