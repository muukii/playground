import Foundation

var buffer: [String : [Int]] = [:]

better: do {
  buffer["hello", default: []].append(contentsOf: [1,2,3])
  buffer["hello"]
}

basic: do {
  
  if let _ = buffer["abc"] {
    buffer["abc"]!.append(contentsOf: [1,2,3])
  } else {
    let c = [1,2,3]
    buffer["abc"] = c
  }
  
}

buffer
