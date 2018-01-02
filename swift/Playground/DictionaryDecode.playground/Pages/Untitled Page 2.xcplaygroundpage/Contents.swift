//: [Previous](@previous)

import Foundation

let json = """
{

}

""".data(using: .utf8)!

struct Config : Decodable {
  var name: String? = "hoge"
}

let decoder = JSONDecoder()

print(try decoder.decode(Config.self, from: json))

//: [Next](@next)
