import UIKit

import PlaygroundSupport

let traits: [ UIFontDescriptor.TraitKey : Any] = [
  UIFontDescriptor.TraitKey.weight : UIFont.Weight.bold,
]

let baseFont = UIFont.italicSystemFont(ofSize: 12)
let descriptor = UIFont.systemFont(ofSize: 20).fontDescriptor.withSymbolicTraits([
  UIFontDescriptor.SymbolicTraits.traitBold,
  UIFontDescriptor.SymbolicTraits.traitItalic
  ])!

print(descriptor)



descriptor.postscriptName

let label = UILabel()

//label.font = UIFont(descriptor: UIFontDescriptor(name: ".SFUIText-BoldItalic", size: 0), size: 32)
label.font = UIFont(descriptor: descriptor, size: 32)

label.text = "3.25"
label.textColor = .white

label.sizeToFit()

PlaygroundPage.current.liveView = label
