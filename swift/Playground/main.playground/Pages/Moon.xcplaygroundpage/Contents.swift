//: [Previous](@previous)

import Foundation

let moons = ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔"]

let set = Array<Array<String>>(repeating: moons, count: 100)
set.flatMap { $0.forEach { print($0, terminator: "") }}
"\\033[1D"

//: [Next](@next)
