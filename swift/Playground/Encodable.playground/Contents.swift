//: Playground - noun: a place where people can play

import Foundation

struct RequestBody: Encodable {
  
  enum Field: String, Encodable {
    case a = "_a"
    case b
    case c
  }
  
  let limit: UInt
  let offset: UInt
  let fields: [Field]
  let requestCreatedAt: Date = .init()
  
  // For customization, optional
  private enum CodingKeys: String, CodingKey {
    case limit = "__limit"
    case offset
    case fields
    case requestCreatedAt
  }
}

let r = RequestBody(limit: 10, offset: 20, fields: [.a, .b, .c])

let e = JSONEncoder()
e.dateEncodingStrategy = .millisecondsSince1970
e.outputFormatting = .prettyPrinted
let data = try e.encode(r)

print(String(data: data, encoding: .utf8)!)
