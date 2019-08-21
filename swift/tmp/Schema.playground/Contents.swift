import Foundation

enum Filter : Codable {

  enum CodingKeys: CodingKey {
    case cube
    case brightness
  }

  case cube(String)
  case brightness(Int)
}

let filters: [Filter] = []

let e = JSONEncoder()

try e.encode(filters)

