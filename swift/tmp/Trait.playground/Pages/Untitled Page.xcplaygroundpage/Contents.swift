import UIKit





public protocol _Context_Group_Any {
  
}

public protocol _Context_Group_GL : _Context_Group_Any {}

public protocol _Context_Group_KR : _Context_Group_GL {}

public protocol _Context_Group_JP : _Context_Group_Any {}

public protocol _Context_Group_TW : _Context_Group_GL {}


public enum AnyGroup : _Context_Group_Any {
  
  public enum JP: _Context_Group_JP {}
  
  public enum GL: _Context_Group_GL {
    public enum KR: _Context_Group_KR {}
    public enum TW: _Context_Group_TW {}
  }
  
}


class Deps {

  var apiProvider: Void?
  var dataStack: Void?
}

struct Service<Group: _Context_Group_Any> {
  let service: Deps
}

extension Service where Group : _Context_Group_GL {
  
  func fetchPhotoRating() {
    
  }
  
}

extension Service where Group == AnyGroup {
  
  func convertToJP() -> Service<AnyGroup.JP> {
    return Service<AnyGroup.JP>(service: service)
  }
  
  func convertToGL() -> Service<AnyGroup.GL> {
    return Service<AnyGroup.GL>(service: service)
  }
  
  func convertToTW() -> Service<AnyGroup.GL.TW> {
    return Service<AnyGroup.GL.TW>(service: service)
  }
  
  func convertToKR() -> Service<AnyGroup.GL.KR> {
    return Service<AnyGroup.GL.KR>(service: service)
  }
  
}

extension Service where Group == AnyGroup.GL {
  
  func convertToTW() -> Service<AnyGroup.GL.TW>? {
    // condition
    return Service<AnyGroup.GL.TW>(service: service)
  }
  
  func convertToKR() -> Service<AnyGroup.GL.KR>? {
    // condition
    return Service<AnyGroup.GL.KR>(service: service)
  }
}

class CommonViewController {
  
  func run() {
    
    let container: Service<AnyGroup> = Service<AnyGroup>.init(service: .init())
    
    container.service
    
    let converted: Service<AnyGroup.GL.TW> = container.convertToTW()
    
    ForTWViewController(container: converted)
    
    ForGlobalViewController(container: container.convertToGL())
  }
  
}

class ForTWViewController {
  
  init(container: Service<AnyGroup.GL.TW>) {
    
  }
}

class ForGlobalViewController {
  
  init(container: Service<AnyGroup.GL>) {

  }
}

class ForJPViewController {
  
  init(container: Service<AnyGroup.JP>) {
    
  }
}

class ForKRViewController {
  
}
