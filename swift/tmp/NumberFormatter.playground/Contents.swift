
import Foundation

pow(0, 0.8)
pow(1, 0.8)
pow(2, 0.8)

let f: (Double) -> Double = { x in
  (pow(x + 1, 0.4) * 0.1) - 0.1
}

for i in 0..<4 {
 print(f(Double(i)))
}

