//: [Previous](@previous)

import Foundation

let url = URL(fileURLWithPath: "~/Desk")

URL.init(string: "~/")?.standardizedFileURL

var u = URL(string: "~/")
u?.resolveSymlinksInPath()
print(u)
print(url.standardizedFileURL)

("~/" as NSString).standardizingPath


//: [Next](@next)
