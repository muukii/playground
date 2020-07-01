
protocol MyProtocol {
    
}

class ClassObject: MyProtocol {
  
}

struct StructObject: MyProtocol {
  
}

//@available(*, unavailable)
func run<P: MyProtocol>(object: P) where P : AnyObject {
  print("run", object)
}

func run<P: MyProtocol>(object: P) {
  print("run", object)
}

let c = ClassObject()

let s = StructObject()

run(object: c)

run(object: s)
