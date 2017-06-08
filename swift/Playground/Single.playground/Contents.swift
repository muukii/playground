//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

// Load the NSViews from a .NIB file
var myViews = NSArray()
Bundle.main.loadNibNamed(NSNib.Name(rawValue: "MyView"), owner:nil, topLevelObjects:&myViews)

// Present the view in Playground
PlaygroundPage.current.liveView = myViews[0] as? NSView
