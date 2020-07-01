import Cocoa

func modify(_ closure: (String) -> Void) {
  
}

let value: String
modify { _ in
  value = ""
}

print(value)
