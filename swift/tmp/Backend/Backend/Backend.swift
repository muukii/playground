
public protocol _Context_Group {
  
}

public enum Groups {
  
  public enum JP: _Context_Group {}
  public enum KR: _Context_Group {}
  public enum TW: _Context_Group {}
  public enum TH: _Context_Group {}
  public enum Other: _Context_Group {}
  public enum Unknown: _Context_Group {}
  
}

public protocol _GroupedContext {
  
  associatedtype Group : _Context_Group
}

// MARK: - Contexts
public enum Contexts {
  
  // MARK: - LoggedOut
  public struct LoggedOut<Service: _Services_LoggedOut> : _GroupedContext {
    
    // MARK: - Nested types
    
    public typealias Group = Service.Group
    
    // MARK: - Properties
    
    public let service: Service
    
    // MARK: - Initializers
    
    init(service: Service) {
      self.service = service
    }
    
    // MARK: - Functions
    
  }
  
  public struct LoggedIn<Service: _Services_LoggedIn> : _GroupedContext {
    
    public typealias Group = Service.Group
    
    // MARK: - Properties
    
    public let service: Service
    
    // MARK: - Initializers
    
    init(service: Service) {
      self.service = service
    }
    
    // MARK: - Functions

  }

}

public protocol Namespacing {
  associatedtype Base
  var base: Base { get }
}

// MARK: - Services

public protocol _Services_Base {
  associatedtype Group: _Context_Group
}

public protocol _Services_LoggedOut: _Services_Base {
  
}

public protocol _Services_LoggedIn: _Services_Base {
  
}

public enum Services {
  
  public final class JPLoggedOut: _Services_LoggedOut {
    
    public typealias Group = Groups.JP
    
    init() {
      
    }
  }
  
  public final class JPLoggedIn: _Services_LoggedIn {
    
    public typealias Group = Groups.JP
    
    init() {
      
    }
  }
  
  public final class LoggedOut<Group>: _Services_LoggedOut where Group : _Context_Group {
    
    init() {
      
    }
  }
  
  public final class LoggedIn<Group>: _Services_LoggedIn where Group : _Context_Group {
    
    init() {
      
    }
  }
  
}

extension Services.LoggedOut {
}

extension Services.LoggedIn {
  
  public enum Namespaces {
    
    public struct JPMe : Namespacing {
      public typealias Base = Services.LoggedIn<Groups.JP>
      public let base: Base
      init(_ base: Base) {
        self.base = base
      }
    }
    
    public struct Me : Namespacing {
      public typealias Base = Services.LoggedIn<Group>
      public let base: Base
      init(_ base: Base) {
        self.base = base
      }
    }
    
    public struct Approach : Namespacing {
      public typealias Base = Services.LoggedIn<Group>
      public let base: Base
      init(_ base: Base) {
        self.base = base
      }
    }
  }
}

extension Services.LoggedIn {
  
  public var me: Namespaces.Me {
    return .init(self)
  }
  
  public var approach: Namespaces.Approach {
    return .init(self)
  }
  
}

extension Services.LoggedIn where Group == Groups.JP {
  
  public var jpMe: Namespaces.JPMe {
    return .init(self)
  }
  
}

extension Services.LoggedIn.Namespaces.Me where Group == Groups.JP {

  public func fetchMe() {
    print(base)
  }
}

extension Services.LoggedIn.Namespaces.Approach {

  public func sendLike() {
    print(base)
  }
}

extension Services.LoggedIn {
  public func foo() {
    print("Foo1")
  }
}

extension Services.LoggedIn where Group == Groups.JP {
  
  public func foo() {
    print("Foo2")
  }
}
