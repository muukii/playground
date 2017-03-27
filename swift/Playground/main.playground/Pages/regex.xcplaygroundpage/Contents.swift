//: [Previous](@previous)

import Foundation

let t = "{{ abc_aa }} {{ abc }} {{abc}}"

func match(pattern: String, source: String) -> [String] {
  return []
}

do {
  let regex = try! NSRegularExpression(pattern: "\\{\\{\\s*(.+?)\\s*\\}\\}", options: [])
  print(regex)
  let r = regex.matches(in: t, options: [], range: NSRange(location: 0, length: t.characters.count))
  r.forEach { a in
    let s = (t as NSString).substring(with: a.rangeAt(1))
    print(s)
  }
}



// try! NSRegularExpression(pattern: "{{\\s*(.+?)\\s*}}", options: [])

//: [Next](@next)
