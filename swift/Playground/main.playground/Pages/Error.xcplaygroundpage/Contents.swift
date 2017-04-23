//: [Previous](@previous)

import Foundation

enum Error: Swift.Error, LocalizedError {
  case a

  var errorDescription: String? {
    switch self {
    case .a:
      return "hello-20345786304958740958704985670495867029485-30948510-94385-3094851290-438530-948510-394851390-4852390-485-239048529048523904852903845-2903485-29034alskdjg;as;kdfja;slkdfja;lskdfwerpoituweproituwperoituwperoituwperoituwpeorituwpeori"
    }
  }
  
  var _domain: String {
    return "jp"
  }
  
  var failureReason: String? {
    print("called reason")
    return "asd"
  }
}

print((Error.a as NSError))

NSError(domain: "jp.eure.pairs", code: 0, userInfo: [:])

//: [Next](@next)
