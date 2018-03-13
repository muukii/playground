//: Playground - noun: a place where people can play

public struct Identifier<TargetType : IdentifiableType, RawValueType : Hashable & Codable> : Hashable, Codable {

  public let rawValue: RawValueType

  public init(_ rawValue: RawValueType) {
    self.rawValue = rawValue
  }
}

public protocol IdentifiableType {

  associatedtype IdentifierRawValueType : Hashable, Codable

  var identifier: Identifier<Self, IdentifierRawValueType> { get }
}

struct Shop {

  let id: String
}

struct Partner : IdentifiableType {

  let identifier: Identifier<Partner, String>
  let id: Identifier<Partner, Int>
}

let p = Partner(identifier: .init(""))

let id = Identifier<Partner, String>.init("hoge")

func fetch(by identifier: Identifier<Partner, String>) -> Partner {
  fatalError()
}
