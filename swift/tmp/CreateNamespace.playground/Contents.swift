public struct Group<Base> {

  public let base: Base

  public init(_ base: Base) {
    self.base = base
  }
}

public protocol GroupCompatible {

  associatedtype CompatibleType
  
  var rx: Group<CompatibleType> { get set }
}

extension GroupCompatible {

  public var rx: Group<Self> {
    get {
      return Group(self)
    }
    set {
      // this enables using Reactive to "mutate" base object
    }
  }
}
