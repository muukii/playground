//: [Previous](@previous)

import Foundation

let start = Date(timeIntervalSince1970: 0)
let end = Date(timeIntervalSince1970: 10)

ClosedRange<Date>.init(uncheckedBounds: (start, end))
ClosedRange<Date>.init(uncheckedBounds: (end, start))

start...end
start..<end


//: [Next](@next)
