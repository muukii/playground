protocol Model: class { }

protocol Wrapper {
  associatedtype T: Model
  func doSomething<U>(with: MyType<U>) where U : T
}

struct MyType<T: Model> : Wrapper {
  
  
  
  func doSomething<U>(with: MyType<U>) where T : AnyObject, U : T {
    
  }
}


