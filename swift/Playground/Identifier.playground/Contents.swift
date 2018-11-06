
public protocol Identifiable {

  associatedtype RawIdentifierType : Hashable
  var rawIdentifier: RawIdentifierType { get }
}

extension Identifiable {

  var identifier: Identifier<Self> {
    return Identifier<Self>.init(rawIdentifier)
  }
}

public struct Identifier<T : Identifiable> : Hashable {

  public let raw: T.RawIdentifierType

  public init(_ raw: T.RawIdentifierType) {
    self.raw = raw
  }
}

struct MyModel : Identifiable {
  var rawIdentifier: String
}


let model = MyModel(rawIdentifier: "ABC")
let identifier: Identifier<MyModel> = model.identifier
let rawIdentifier = identifier.raw
