import Foundation

struct Foo {
    
}

class Bar {
    
}

var foo = Foo()
withUnsafePointer(to: foo) { print($0) }
withUnsafePointer(to: foo) { print($0) }

"".core
