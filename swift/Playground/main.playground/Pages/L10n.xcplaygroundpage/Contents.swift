//: [Previous](@previous)

import Foundation

extension String {
  func camelCased() -> String {

    let tokens = self.components(separatedBy: ".")

    guard let first = tokens.first else {
      return self
    }

    let cased = tokens.dropFirst()
      .map { token in
        token.characters.first
          .map {
            String($0).uppercased().characters + token.characters.dropFirst()
          }
          .map {
            String($0)
        }
      }
      .flatMap { $0 }

    let resolvedTokens = [first] + cased
    return resolvedTokens.joined()
  }
}

let dic: [String : [String : String]] = [
  "apple.orange.lemon1" : ["Base" : "hello"],
  "apple.orange.lemon2" : ["Base" : "hello"],
  "apple.orange.lemon3" : ["Base" : "hello"],
]

var lines: [String] = []

lines.append("enum L10n {")
dic.forEach { key, value in
  lines.append("  case \(key.camelCased())")
}
lines.append("}")
lines.append("extension L10n: CustomStringConvertible {")
lines.append("  var description: String { return self.string }")
lines.append("  var string: String {")
lines.append("    switch self {")
dic.forEach { key, value in
  lines.append("    case .\(key.camelCased()):")
  lines.append("      return L10n.tr(key: \"\(key)\")")
}
lines.append("    }")
lines.append("  }")
lines.append("")
lines +=
[
  "  private static func tr(key: String, _ args: CVarArg...) -> String {",
  "    let format = AppLocalizedString(key, comment: \"\", bundle: Bundle(for: BundleClass.self))",
  "    return String(format: format, locale: Locale.current, arguments: args)",
  "  }",
]

lines.append("}")

let result = lines.joined(separator: "\n")

print(result)

//: [Next](@next)
