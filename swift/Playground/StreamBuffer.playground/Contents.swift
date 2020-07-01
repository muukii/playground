import Combine

let input = PassthroughSubject<String, Never>()

let output = input.buffer(size: 3, prefetch: .byRequest, whenFull: .dropOldest)
  .makeConnectable()

output.connect()

input.send("1")
input.send("2")
input.send("3")
input.send("4")
input.send("5")

output.sink { (value) in
  print(value)
}

