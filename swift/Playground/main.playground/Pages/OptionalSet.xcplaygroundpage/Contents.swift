//: [Previous](@previous)

import Foundation

public struct Options: OptionSet {
  public let rawValue: UInt64
  
  static let initial: Options = .init(rawValue: 1 << 0)
  static let update: Options = .init(rawValue: 1 << 1)
  static let remove: Options = .init(rawValue: 1 << 61)
  
  public init(rawValue: UInt64) {
    self.rawValue = rawValue
  }
}

var option: Options = .remove

String(option.rawValue, radix: 2)

option.insert(.initial)
option.insert(.initial)

option.contains(.remove)

option.rawValue

//: [Next](@next)
