//: [Previous](@previous)

import Foundation

enum Get {}
enum GetSet {}

protocol VariableType: class {
  associatedtype AccessType
  associatedtype ElementType
  var variable: Variable<AccessType, ElementType> { get }
}

final class Variable<Access, Element>: VariableType {

  typealias AccessControlType = Access
  typealias ElementType = Element

  fileprivate var _source: Element

  init(_ source: Element) {
    self._source = source
  }

  var variable: Variable<Access, Element> {
    return self
  }
}

extension VariableType where AccessType == Get {

  var value: ElementType {
    return variable._source
  }
}

extension VariableType where AccessType == GetSet {

  var value: ElementType {
    get {
      return variable._source
    }
    set {
      variable._source = newValue
    }
  }
}

let readonlyVar = Variable<Get, Int>(3)
readonlyVar.value

let getsetVar = Variable<GetSet, Int>(10)
getsetVar.value = 14

//: [Next](@next)
