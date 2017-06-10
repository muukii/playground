//: Playground - noun: a place where people can play

import Foundation

extension Array where Element == CodingKey? {
  func prettyPrint() -> String {
    let path: [String] = map {
      guard let path = $0 else {
        return "Root"
      }
      
      if let index = path.intValue {
        return index.description
      }
      
      return path.stringValue
    }
    return path.joined(separator: " -> ")
  }
}

func dumpDecodingError(_ error: DecodingError) {
  
  func dumpContext(_ context: DecodingError.Context) {
    print("codingPath:", context.codingPath.prettyPrint())
    print("debugDescription: ", context.debugDescription)
  }
  
  switch error {
  case .dataCorrupted(let context):
    print("Error:", "dataCorrupted")
    dumpContext(context)
  case .keyNotFound(let key, let context):
    print("Error:", "keyNotFound")
    print(key.stringValue)
    dumpContext(context)
  case .typeMismatch(let type, let context):
    print("Error:", "typeMismatch")
    print("targetType:", type)
    dumpContext(context)
  case .valueNotFound(let type, let context):
    print("Error:", "valueNotFound")
    print("targetType:", type)
    dumpContext(context)
  }
}

let string = """
[
  {
    "age" : 18,
    "state" : {
      "isBlocked" : false,
      "isFavorite" : false
    },
    "nickname" : "muukii",
    "name" : "Hiroshi Kimura",
    "height" : 180,
    "flags" : ["a", "b", "c"]
  },
  {
    "age" : 18,
    "state" : {
      "isBlocked" : false,
      "isFavorite" : false
    },
    "name" : "John Estropia",
    "height" : 180
  },
  {
    "age" : null,
    "state" : {
      "isBlocked" : false,
      "isFavorite" : false
    },
    "name" : "John Estropia",
    "height" : 180
  }
]
"""

let data = string.data(using: .utf8)!
let decoder = JSONDecoder()

/*:
 
 # I would like to get Information that failed decoding.
 
 - key-path
 - index
 
 */

do {
  
  struct User: Decodable {
    
    let name: String
    let flags: [String]?
  }
  
  do {
    let r = try decoder.decode([User].self, from: data)
    print("🍿", r)
  } catch let error as DecodingError {
    dumpDecodingError(error)
  } catch {
    dump(error)
  }
}

print("")

/*:
 
 ## typeMismatch
 
 */

do {
  
  struct User: Decodable {
    
    struct State: Decodable {
      let isFavorite: String
    }
    
    let state: State
  }
  
  do {
    let r = try decoder.decode([User].self, from: data)
    print("🍿", r)
  } catch let error as DecodingError {
    dumpDecodingError(error)
  } catch {
    dump(error)
  }
}

print("")

/*:
 
 ## valueNotFound
 
 */

do {
  
  struct User: Decodable {
    
    let age: UInt
  }
  
  do {
    let r = try decoder.decode([User].self, from: data)
    print("🍿", r)
  } catch let error as DecodingError {
    dumpDecodingError(error)
  } catch {
    dump(error)
  }
}

print("")

/*:
 
 ## valueNotFound
 
 */

do {
  
  struct User: Decodable {
    
    struct A: Decodable {
      
      struct B: Decodable {
        
        let value: String?
      }
      
      let b: B
    }
    
    let a: A
  }
  
  do {
    let r = try decoder.decode([User].self, from: data)
    print("🍿", r)
  } catch let error as DecodingError {
    dumpDecodingError(error)
  } catch {
    dump(error)
  }
}

print("")

/*:
 
 ## valueNotFound
 
 */

do {
  
  struct User: Decodable {
    
    struct State: Decodable {
      
      struct B: Decodable {
        
        let value: String?
      }
      
      let b: B
    }
    
    let state: State
  }
  
  do {
    let r = try decoder.decode([User].self, from: data)
    print("🍿", r)
  } catch let error as DecodingError {
    dumpDecodingError(error)
  } catch {
    dump(error)
  }
}
