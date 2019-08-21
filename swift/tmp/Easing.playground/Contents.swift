import Foundation

func easing(_ x: CGFloat) -> CGFloat {
  return x == 1 ? x : 1 - pow(2, (-10 * x))
}

stride(from: 0.0, to: 1.0, by: 1 / 8).forEach { v in
  let v = easing(CGFloat(v)) * 0.2
  print(v)
  v
  return
}
