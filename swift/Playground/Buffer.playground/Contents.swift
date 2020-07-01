import Combine

let input = PassthroughSubject<String, Never>.init()

let output = input
  .buffer(size: 3, prefetch: .keepFull, whenFull: .dropOldest)

input.send("a")
input.send("a")
input.send("a")

output.sink { (o) in
  print(o)
}

input.send("a")
input.send("a")

