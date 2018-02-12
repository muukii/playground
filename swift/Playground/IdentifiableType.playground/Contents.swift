//: Playground - noun: a place where people can play

public struct Identifier<TargetType : IdentifiableType, RawValueType : Hashable & Codable> : Hashable, Codable {

  public let rawValue: RawValueType

  public init(_ rawValue: RawValueType) {
    self.rawValue = rawValue
  }
}

public protocol IdentifiableType {

  associatedtype IdentifierRawValueType : Hashable, Codable

  typealias ID = Identifier<Self, IdentifierRawValueType>

  var identifier: ID { get }
}

struct Partner : IdentifiableType {
  
  typealias IdentifierRawValueType = String

  let identifier: ID
}

let p = Partner(identifier: .init(""))

func fetch(by identifier: Identifier<Partner, String>) {
  
}
