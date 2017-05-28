//: [Previous](@previous)

import Foundation

var c = URLComponents()

c.scheme = "https"
c.host = "abc.com"
c.path = "/2.0/foo"
c.user = "muukii"
c.password = "abc"
c.port = 8080
c.queryItems = [
  URLQueryItem.init(name: "foo", value: "bar")
]

c

public struct WebRequest {
  
  public var urlComponents = URLComponents()
  public var httpHeaderFields: [String : String] = [:]
  
  public init() {
    
  }
  
  func build() -> URLRequest? {
    
    guard let url = urlComponents.url else {
      return nil
    }
    
    var r = URLRequest(url: url)
    r.httpMethod = "GET"
    
    httpHeaderFields.map { key, value in
      r.setValue(value, forHTTPHeaderField: key)
    }
    
    return r
  }
}

//: [Next](@next)
