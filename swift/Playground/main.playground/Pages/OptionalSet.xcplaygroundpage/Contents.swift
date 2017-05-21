//: [Previous](@previous)

import Foundation

public struct Options: OptionSet {
  public let rawValue: UInt64
  
  static let a: Options = .init(rawValue: 1 << 0)
  static let b: Options = .init(rawValue: 1 << 1)
  static let c: Options = .init(rawValue: 1 << 2)
  static let d: Options = .init(rawValue: 1 << 3)
  static let e: Options = .init(rawValue: 1 << 4)
  
  public init(rawValue: UInt64) {
    self.rawValue = rawValue
  }
}

let source: Options = [.a, .b, .c, .d]

source.isStrictSubset(of: [])
source.isSuperset(of: [])
source.isSubset(of: [])

source.isSubset(of: [.a])
source.isSubset(of: [.a, .b, .c])

source.isDisjoint(with: [.a, .b])
source.isSuperset(of: [.a, .e])

//: [Next](@next)
