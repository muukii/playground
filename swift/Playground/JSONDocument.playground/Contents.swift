import Cocoa


enum ValueType {
  case int
  case bool
  case string
  case enumeration([String])
  case anyObject
  case object(Object)
  case oneOf([Object])
  case array(Object)
  
  var documentationString: String {
    switch self {
    case .int:
      return "int"
    case .bool:
      return "bool"
    case .string:
      return "string"
    case .enumeration(let strings):
      return strings.joined(separator: "|")
    case .object(let obj):
      return "Link to \(obj.name)"
    case .oneOf(let objs):
      return "The one of \(objs.map { "[`\($0.name)`](#\($0.name.replacingOccurrences(of: " ", with: "-")))" }.joined(separator: " ,"))"
    case .array(let object):
      return "The array of \(object.name)"
    case .anyObject:
      return "Any object"
    }
  }
}

struct Property {
  let name: String
  let valueType: ValueType
  var required: Bool
  var description: String = ""
}

struct Object {
  let name: String
  var properties: [Property] = []
  var description: String = ""
    
  func addProperty(name: String, valueType: ValueType, required: Bool, description: String = "") -> Object {
    var _obj = self
    _obj.properties.append(.init(name: name, valueType: valueType, required: required, description: description))
    return _obj
  }
  
  func addOwnTypeName() -> Object {
    var _obj = self
    _obj.properties.append(.init(name: "type", valueType: .string, required: true, description: "The object type `\(name)`"))
    return _obj
  }
}

enum Generator {
  
  static func run(targets: [Object]) {
    
    for target in targets {
      print("## \(target.name) object")
      print("### Description")
      print("")
      print("### Properties")
      print("|Name|Value Type|Required|Description|")
      print("|---|---|---|---|")
      for property in target.properties {
        print("|\(property.name)|\(property.valueType.documentationString)|\(property.required)|\(property.description)|")
      }
      print("")
      print("---")
      print("")
    }
    
  }
}

let action = Object(name: "action")
  .addProperty(name: "name", valueType: .string, required: true)
  .addProperty(name: "params", valueType: .anyObject, required: false)

let image = Object(name: "image")
  .addOwnTypeName()
  .addProperty(name: "url", valueType: .string, required: true)
  .addProperty(name: "alt_text", valueType: .string, required: false)

let plainText = Object(name: "plain_text")
  .addOwnTypeName()
  .addProperty(name: "text", valueType: .string, required: true)

let plainButton = Object(name: "plain_button")
  .addOwnTypeName()
  .addProperty(name: "text", valueType: .oneOf([plainText]), required: true, description: "")
  .addProperty(name: "image", valueType: .object(image), required: false, description: "")
  .addProperty(name: "style", valueType: .enumeration(["default", "primary", "danger"]), required: true)
  .addProperty(name: "action", valueType: .object(action), required: true)

let buttonSet = Object(name: "multi_button")
  .addOwnTypeName()
  .addProperty(name: "direction", valueType: .enumeration(["vertical", "horizontal"]), required: true)
  .addProperty(name: "buttons", valueType: .array(plainButton) , required: true)

let option = Object(name: "option")
  .addProperty(name: "text", valueType: .object(plainText), required: true)
  .addProperty(name: "value", valueType: .string, required: true)

let placeholder = Object(name: "placeholder")
  .addProperty(name: "text", valueType: .oneOf([plainText]), required: true)

let selection = Object(name: "selection")
  .addProperty(name: "placeholder", valueType: .object(placeholder), required: true)
  .addProperty(name: "options", valueType: .array(option), required: true)
  .addProperty(name: "minSelectedItems", valueType: .int, required: true)
  .addProperty(name: "maxSelectedItems", valueType: .int, required: false)
  .addProperty(name: "action", valueType: .object(action), required: true)

let imageCard = Object(name: "image_card")
  .addProperty(name: "image", valueType: .object(image), required: true)
  .addProperty(name: "todo", valueType: .string, required: false)

let imageCards = Object(name: "image_cards")
  .addProperty(name: "contents", valueType: .array(imageCard), required: true)
  .addProperty(name: "action", valueType: .object(action), required: true)

let message = Object(name: "message")
  .addProperty(name: "body", valueType: .oneOf([plainText, image]), required: true)
  .addProperty(name: "accessory", valueType: .oneOf([plainButton, buttonSet, selection, imageCards]), required: true, description: "")

Generator.run(targets: [
  action,
  image,
  plainText,
  plainButton,
  buttonSet,
  option,
  placeholder,
  selection,
  imageCard,
  imageCards,
  message,
])


sample: do {
  
  let chunk = Object(name: "chunk")
    .addOwnTypeName()
    .addProperty(name: "aaa", valueType: .string, required: true)
  
  let takoyaki = Object(name: "takoyaki")
    .addOwnTypeName()
    .addProperty(name: "bbb", valueType: .string, required: true)
  
  let daydream = Object(name: "daydream")
    .addOwnTypeName()
    .addProperty(name: "ccc", valueType: .string, required: true)
  
  let layout = Object(name: "layout")
    .addProperty(name: "data", valueType: .oneOf([chunk, takoyaki, daydream]), required: true)
    
  Generator.run(targets: [
    chunk,
    takoyaki,
    daydream,
    layout,
  ])

}
