protocol BoxType {
  init()
}

struct Box: BoxType {
  
  let a: [String] = []
  let b: [String] = []
  let c: [String] = []
  
  init() {}
}

struct Wrapper<Box: BoxType> {
  
  func key<T>(keyPath: KeyPath<Box, T>) -> Int? {
    print(MemoryLayout<Box>.size)
    return MemoryLayout<Box>.offset(of: keyPath)
  }
}

MemoryLayout<Box>.offset(of: \Box.a)
MemoryLayout<Box>.offset(of: \Box.b)
MemoryLayout<Box>.offset(of: \Box.c)

ObjectIdentifier(\Box.a)
ObjectIdentifier(\Box.a)

let w = Wrapper<Box>()
w.key(keyPath: \Box.a)
w.key(keyPath: \Box.b)

dump(\Box.b)

\Box.b == \Box.b
