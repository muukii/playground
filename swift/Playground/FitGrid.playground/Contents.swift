import Foundation

func cal(width: CGFloat, spacing: CGFloat, itemCount: Int, indexInRow: Int) -> CGFloat {
  assert(indexInRow < itemCount)
  
  let itemCount_f = CGFloat(itemCount)
  let targetWidth = width - (spacing * (itemCount_f - 1))
  let extra = targetWidth.truncatingRemainder(dividingBy: itemCount_f)
  let unit = (targetWidth - extra) / itemCount_f
  
  if indexInRow == 1 {
    return unit + extra
  } else {
    return unit
  }
}

func sample(width: CGFloat, itemCount: Int) {
  let spacing: CGFloat = 1
  print(width)
  
  print(
    (0..<itemCount).map {
      cal(width: width, spacing: spacing, itemCount: itemCount, indexInRow: $0)
    }
  )
  
  print(
    (0..<itemCount).map {
      cal(width: width, spacing: spacing, itemCount: itemCount, indexInRow: $0)
    }
    .reduce(0, +) + (spacing * (CGFloat(itemCount) - 1))
  )
  
  print("")

}

sample(width: 375, itemCount: 3)
sample(width: 375, itemCount: 4)
sample(width: 375, itemCount: 5)

0 % 3
1 % 3
2 % 3
3 % 3
4 % 3

