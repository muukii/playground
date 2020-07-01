
import Foundation

struct MessageUI : Encodable {
  var text: String
}

let encoder = JSONEncoder()
encoder.outputFormatting = [.prettyPrinted]

let data = try! encoder.encode(MessageUI(text: "Hello"))
let text = String(data: data, encoding: .utf8)!

print(text)



