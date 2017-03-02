//: [Previous](@previous)

import Foundation
import RxSwift
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

let set: [String] = ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔"]

Observable.from(set).debug().subscribe()

//: [Next](@next)
