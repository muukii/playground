//: [Previous](@previous)

import Foundation

let a = UserDefaults(suiteName: "abc")
let b = UserDefaults(suiteName: "me.muukii.fil")

a?.set(30, forKey: "num")
a?.integer(forKey: "num")
a?.object(forKey: "num")

let _a = UserDefaults(suiteName: "abc")
_a?.value(forKey: "num")

let s = UserDefaults.standard

s.set(30, forKey: "num")
s.integer(forKey: "num")

s.volatileDomainNames

UserDefaults.globalDomain
UserDefaults.argumentDomain
//: [Next](@next)
