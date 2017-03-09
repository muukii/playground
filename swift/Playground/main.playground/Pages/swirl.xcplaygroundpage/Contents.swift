//: [Previous](@previous)

import Foundation

/*
 🃏🃏🃏🃏🃏🃏🃏
 🃏🎴🎴🎴🎴🎴🃏
 🃏🎴🀄️🀄️🀄️🎴🃏
 🃏🎴🀄️🤠🀄️🎴🃏
 🃏🎴🀄️🀄️🀄️🎴🃏
 🃏🎴🎴🎴🎴🎴🃏
 🃏🃏🃏🃏🃏🃏🃏
 */

func mysteryCircle(sides: [String], center: String) -> String {

  func wave(min: Int, max: Int, count: Int) -> [Int] {

    var array = [Int](repeating: max, count: count)

    let side = (min..<max).map { $0 }
    array.replaceSubrange(Range<Int>(side.indices), with: side)
    let center = array.removeLast()
    return array + [center] + Array(array.reversed())
  }

  let chars = sides + [center]

  var message: String = ""
  wave(min: 0, max: chars.count, count: chars.count).forEach { i in
    let c = i

    let indices = wave(min: 0, max: c, count: chars.count)

    indices.forEach { s in
      message.append(chars[s].description)
    }
    message.append("\n")
  }

  return message
}

//print(mysteryCircle(sides: ["🌞","👾","🤡","🤠","🌎","⭐️","🌺"], center: "🤠"))

print(mysteryCircle(sides: [":muukii:",":satoshin:"], center: ":muukii:"))

//: [Next](@next)
