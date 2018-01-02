//: Playground - noun: a place where people can play

import Foundation

let json = """
{
  "config" : {
    "languages" : ["Base", "zh-Hant"]
  },
  "strings" : {
    "foo" : {
      "id" : "a",
      "Base" : "{{ count }}件",
      "zh-Hant" : "{{ count }}件"
    },
    "bar": {
      "id" : "b",
      "Base": "I'm {{ age }} and {{ foo.bar }} or {{ apple_orange }} {{ car-var }}"
    },
    "bazz" : {
      "id" : "c",
      "Base" : "{{ count }}件",
      "zh-Hant" : "{{ count }}件"
    }
  }
}

""".data(using: .utf8)!

struct Foo: Codable {
  
  struct Configuration: Codable {
    
  }
  
  struct StringSet: Codable {
    
    struct LocalizedString: Codable {
      
      let id: String
      let key: String
      let strings: [String : String]
      
    }
    
    let strings: [String : LocalizedString]
  }
  
  let configuration: Configuration
  let strings: StringSet
  
}

extension Foo {
  
  private enum CodingKeys: String, CodingKey {
    case configuration = "config"
    case strings
  }
}

extension Foo.StringSet {
  
  private struct Key: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
      self.stringValue = stringValue
    }
    
    var intValue: Int? { return nil }
    init?(intValue: Int) { return nil }
  }
  
  init(from decoder: Decoder) throws {
    
    let c = try decoder.container(keyedBy: Key.self)
    
    var _s: [String : LocalizedString] = [:]
    
    for key in c.allKeys {
      _s[key.stringValue] = try c.decode(LocalizedString.self, forKey: key)
    }
    
    self.strings = _s
  }
}

extension Foo.StringSet.LocalizedString {
  
  private struct Key: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
      self.stringValue = stringValue
    }
    
    var intValue: Int? { return nil }
    init?(intValue: Int) { return nil }
    
    static let id = Key(stringValue: "id")!
  }
  
  init(from decoder: Decoder) throws {
    
    let c = try decoder.container(keyedBy: Key.self)
    
    print(decoder.codingPath.last!!.stringValue)
    print(decoder.userInfo)
    
    self.id = try c.decode(String.self, forKey: .id)
    
    var _strings: [String : String] = [:]
    for key in c.allKeys where key.stringValue != Key.id.stringValue {
      _strings[key.stringValue] = try c.decode(String.self, forKey: key)
    }
    self.strings = _strings
    self.key = ""
  }
}

let decoder = JSONDecoder()

do {
  let r = try decoder.decode(Foo.self, from: json)
  
  let s = r.strings.strings.sorted(by: { $0.key < $1.key })
  print(s.map { $0.key })
  
} catch {
  print(error)
}

