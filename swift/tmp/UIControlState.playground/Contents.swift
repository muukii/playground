import UIKit

var state = UIControl.State.normal
String.init(state.rawValue, radix: 2, uppercase: false)

state.insert(.disabled)

String.init(state.rawValue, radix: 2, uppercase: false)

state.insert(.selected)

String.init(state.rawValue, radix: 2, uppercase: false)

state.contains([.selected, .highlighted])

state.subtracting([.selected, .highlighted]).rawValue
