//: Playground - noun: a place where people can play

import Foundation

class Token {
  
}

let token = Token()

NotificationCenter.default.post(name: .init(rawValue: "foo"), object: token)

struct Context<T> {
  
  let name: Notification.Name
  
  static var updateList: Context<Token> { return Context<Token>(name: .init(rawValue: "foobar")) }
}

extension NotificationCenter {
  
  func post<T>(context: Context<T>, object: T) {
    post(name: context.name, object: object)
  }
  
  func addObserver<T>(context: Context<T>, object: T, handler: @escaping (T) -> Void) -> NSObjectProtocol {
    
    return NotificationCenter.default.addObserver(
      forName: context.name,
      object: object,
      queue: nil) { (notification) in
        
        let obj = notification.object
        
        handler(obj as! T)
    }
  }
}

let t = NotificationCenter.default.addObserver(context: .updateList, object: token) { (token: Token) in
  print(token)
}

NotificationCenter.default.post(context: .updateList, object: token)











//struct MyNotification<T> {
//
//  let source: Notification
//
//  init<T>(source: Notification, context: ) {
//
//  }
//}

