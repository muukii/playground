//: [Previous](@previous)

import Foundation

extension String {

  public init(template: String, args: [String : CustomStringConvertible]) {

    // 適当
    var text = template

    for arg in args {
      let format = "{{ \(arg.key) }}"
      assert(text.range(of: format) != nil, "Not found key : \(arg.key)")
      text = text.replacingOccurrences(of: format, with: arg.value.description)
    }

    self = text
  }

  public func asTemplate(args: [String : CustomStringConvertible]) -> String {
    return String(template: self, args: args)
  }
}

let template = "hello {{ nickname }}, {{ age }}, {{ hight }}🙏"

let string = String(template: template, args: [
  "nickname" : "muukii",
  "age" : 1,
  "hight" : 198.4,
  ])

template.asTemplate(args: [
  "nickname" : "muukii",
  "age" : 18,
  "hight" : 198.4,
  ])


//: [Next](@next)
