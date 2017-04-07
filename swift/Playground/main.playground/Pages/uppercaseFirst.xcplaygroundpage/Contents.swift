//: [Previous](@previous)

import Foundation

// from: https://github.com/apple/swift-protobuf/blob/master/Sources/protoc-gen-swift/StringUtils.swift#L115

func uppercaseFirst(_ s: String) -> String {
  var out = s.characters
  if let first = out.popFirst() {
    return String(first).uppercased() + String(out)
  } else {
    return s
  }
}

uppercaseFirst("hey")

var muukii = "muukii".characters
var muukii2 = muukii
muukii.popFirst()
muukii.popFirst()

String(muukii)
String(muukii2)
//: [Next](@next)
