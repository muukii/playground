//: [Previous](@previous)

import Foundation

let date = Date()

let formatter = DateFormatter()

formatter.dateStyle = .none
formatter.timeStyle = .short
formatter.doesRelativeDateFormatting = true

formatter.string(from: date)

//: [Next](@next)
