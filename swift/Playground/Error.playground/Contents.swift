//: Playground - noun: a place where people can play

import Foundation

public struct ErrorReport : CustomNSError, LocalizedError, CustomStringConvertible {
  
  public let domain: String
  public let errorCode: Int
  public let errorUserInfo: [String : Any]
  
  public var _domain: String {
    return domain
  }
  
  public var errorDescription: String? {
    return description
  }
  
  public var failureReason: String? {
    return nil
  }
  
  public var recoverySuggestion: String? {
    return nil
  }
  
  public var helpAnchor: String? {
    return nil
  }
  
  public let description: String
  
  public init(
    domain: String,
    code: Int,
    description: String,
    userInfo: [String : Any],
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
    ) {
    
    self.domain = domain
    self.errorCode = code
    
    var _u = userInfo
    _u["location_file"] = file
    _u["location_function"] = file
    _u["location_line"] = line
    
    self.errorUserInfo = _u
    self.description = description
  }
}

let error = ErrorReport.init(domain: "me.muukii", code: 100, description: "aaa", userInfo: [:])

let nserror = error as NSError

print(nserror)

nserror.code
nserror.domain
nserror.localizedDescription
nserror.localizedFailureReason
nserror.localizedRecoveryOptions
nserror.localizedRecoverySuggestion
nserror.userInfo
