import Foundation
import AppKit

/*:

 */
NSString.conforms(to: NSCopying.self)
let a = NSMutableString(string: "A")
let b = a.copy() as! NSString

a == b
a === b

Unmanaged.passUnretained(a).toOpaque().debugDescription
Unmanaged.passUnretained(b).toOpaque().debugDescription

NSString(string: "A") === NSString(string: "A")

NSMutableString.conforms(to: NSCopying.self)

NSMutableString(string: "A") == NSMutableString(string: "A")
NSMutableString(string: "A") === NSMutableString(string: "A")

NSMutableString(string: "A").isEqual(NSMutableString(string: "A"))

/*:

 */
NSColor.conforms(to: NSCopying.self)
NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 0)
  == NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 0)

/*:

 */
NSView.conforms(to: NSCopying.self)
NSView() == NSView()
