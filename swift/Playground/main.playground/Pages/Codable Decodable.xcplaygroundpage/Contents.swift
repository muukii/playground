//: [Previous](@previous)

import UIKit

let jsonPath = Bundle.main.path(forResource: "unsplash_shots_response", ofType: "json")!
let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))

print("hi")

//: [Next](@next)
