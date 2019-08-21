import Foundation

func track<V>(_ v: V) -> V {
  print("Pass", v)
  return v
}

(0...10)
  .map { String($0) }
  .lazy
  .map { track($0) }

let array = (0...10).map { $0 }

for (a, b) in zip(array, array.indices).reversed() {
  print(a,b)
}


