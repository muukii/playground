//: Playground - noun: a place where people can play

import Foundation

let jsonPath = Bundle.main.path(forResource: "unsplash_shots_response", ofType: "json")!
let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))

/*:
 
 Has optional variable
 
 */

do {
  
  struct Shot: Decodable {
    
    let id: String
    let name: String?
  }
  
  let decoder = JSONDecoder()
  
  do {
    let shots = try decoder.decode([Shot].self, from: jsonData)
  } catch {
    print(error.localizedDescription)
  }
  
}

/*:
 
 Most simply usage
 
 */

do {
  
  struct Shot: Decodable {
    
    let id: String
    let width: Int
    let height: Int
  }
  
  let decoder = JSONDecoder()
  
  do {
    let shots = try decoder.decode([Shot].self, from: jsonData)
  } catch {
    print(error.localizedDescription)
  }
  
}

/*:
 
 Using customized key
 
 */

do {
  
  struct Shot: Decodable {
    
    let __id: String
    let __width: Int
    let __height: Int
    
    private enum CodingKeys: String, CodingKey {
      case __id = "id"
      case __width = "width"
      case __height = "height"
    }
  }
  
  let decoder = JSONDecoder()
  
  do {
    let shots = try decoder.decode([Shot].self, from: jsonData)
  } catch {
    print(error.localizedDescription)
  }
  
}

/*:
 
 Full cusotomized usage
 
 */

do {
  
  struct Shot: Decodable {
    
    let id: String
    let width: Int
    let height: Int
    let createdAt: Date
    
    init(from decoder: Decoder) throws {
      
      let c = try decoder.container(keyedBy: CodingKeys.self)
      
      id = try c.decode(String.self, forKey: .id)
      height = try c.decode(Int.self, forKey: .width)
      width = try c.decode(Int.self, forKey: .width)
      createdAt = try c.decode(Date.self, forKey: .createdAt)
      
    }
    
    private enum CodingKeys: String, CodingKey {
      case id
      case width
      case height
      case createdAt = "created_at"
    }
  }
  
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .iso8601
  
  do {
    let shots = try decoder.decode([Shot].self, from: jsonData)
  } catch {
    print(error.localizedDescription)
  }
  
}

/*:
 
 Real world
 
 */

do {
  
  struct User: Decodable {
    let id: String
    let bio: String
    let username: String
    let name: String
    let updatedAt: Date
    
    private enum CodingKeys: String, CodingKey {
      case id
      case bio
      case username
      case name
      case updatedAt = "updated_at"
    }
  }
  
  struct Shot: Decodable {
    
    struct URLs: Decodable {
      
      let raw: URL
      let full: URL
      let thumb: URL
      let regular: URL
      let small: URL
      
    }
    
    let id: String
    let width: Int
    let height: Int
    let createdAt: Date
    let updatedAt: Date
    let urls: URLs
    let user: User
    
    private enum CodingKeys: String, CodingKey {
      case id
      case width
      case height
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case urls
      case user
    }
  }
  
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .iso8601
  
  do {
    let shots = try decoder.decode([Shot].self, from: jsonData)
    print(shots)
  } catch {
    print(error.localizedDescription)
  }
  
}
