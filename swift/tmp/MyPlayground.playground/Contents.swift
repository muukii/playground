import Cocoa

class Hoge {
  
  var flag: NSString = ""
  
  func run() {
    
    let context = (
      flag: self.flag,
      void: ()
    )
    
    let _ = {
      context.flag
    }
    
  }
}


//flag
