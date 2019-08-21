//: [Previous](@previous)

protocol FragmentA {
  
}

protocol FragmentB {
  
}

protocol Source {
  
}

struct A {
  let name: String
}

struct B : FragmentA, FragmentB {
  let a: String
  let b: String
  let c: String
}

class Storage<T> {
  
  var source: T?
  
}

let original = Storage<B>()

Storage<FragmentA>

//: [Next](@next)
