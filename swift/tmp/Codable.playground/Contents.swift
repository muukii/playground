import Cocoa

let decoder = JSONDecoder()


let json = """
{ "foo" : null, "bar" : ["a", "b"] }
""".data(using: .utf8)!


struct Content : Decodable {
  
  var foo: [String]?
  var bar: [String]
  
}

try decoder.decode(Content.self, from: json)
