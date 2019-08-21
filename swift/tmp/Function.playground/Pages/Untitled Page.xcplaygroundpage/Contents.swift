import Foundation


func value(_ v: Double) -> Double {
  return log(1 / v)
}

for v in (0..<100) {
  value(Double(v))
}

