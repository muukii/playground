//: [Previous](@previous)

import UIKit

let preferredLanguages = Bundle.main.preferredLocalizations

let locale = Locale.current
let regionCode = locale.regionCode
let calendar = locale.calendar
let device = UIDevice.current

var lines: [String] = []

locale.currencyCode
locale.currencySymbol
locale.identifier

calendar.amSymbol
calendar.monthSymbols
calendar.timeZone

calendar.eraSymbols

device.name
device.model
device.localizedModel
device.systemName
device.systemVersion
device.identifierForVendor

//: [Next](@next)
