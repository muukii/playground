import Foundation

public protocol Group_JP {}

public protocol Group_TW {}

public protocol Group_KR {}

public protocol ContextType {
  
}

public protocol StackType : AnyObject {
  var persistentStore: PersistentStore { get }
}

public protocol Stack_Global_LoggedIn: StackType {
  
  var mainService: Service_Global_LoggedIn_Main { get }
}

public protocol Stack_Global_LoggedOut: StackType {
  
  var mainService: Service_Global_LoggedOut_Main { get }
}

public protocol ServiceType : AnyObject {
  
}

public protocol Service_Global_LoggedIn_Main: ServiceType {
  
}

public protocol Service_Global_LoggedOut_Main : ServiceType {
  
}

public protocol Service_Global_LoggedIn_DynamicBehavior: ServiceType {
  
}

//public protocol Service_JP_LoggedIn_Main: ServiceType {
//
//}
//
//public protocol Service_JP_LoggedOut_Main : ServiceType {
//
//}

public struct ResolvedEnv {
  
}

public final class PersistentStore {
  
}

public enum Groups {
  public enum TW {
    public enum Contexts {
      public struct LoggedOut : ContextType, Group_TW {
        public let resolvedEnv: ResolvedEnv
        public let stack: Stacks.LoggedOut
      }
      
      public struct LoggedIn : ContextType, Group_TW {
        public let resolvedEnv: ResolvedEnv
        public let stack: Stacks.LoggedIn
      }
    }
    
    public enum Stacks {
      public final class LoggedOut : Stack_Global_LoggedOut, Group_TW {
        
        public var mainService: Service_Global_LoggedOut_Main {
          return _mainService
        }
        
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let _mainService: Services.LoggedOut.Main
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedOut.Main
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self._mainService = mainService
        }
      }
      
      public final class LoggedIn : Stack_Global_LoggedIn, Group_TW {
        
        public var mainService: Service_Global_LoggedIn_Main {
          return _mainService
        }
        
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let _mainService: Services.LoggedIn.Main
        public let behaviorService: Services.LoggedIn.DynamicBehaviorService
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedIn.Main,
          behaviorService: Services.LoggedIn.DynamicBehaviorService
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self._mainService = mainService
          self.behaviorService = behaviorService
        }
        
      }
    }
    
    public enum Services {
      
      public enum LoggedOut {
        public final class Main : Service_Global_LoggedOut_Main, Group_TW {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
      }
      
      public enum LoggedIn {
        
        public final class Main : Service_Global_LoggedIn_Main, Group_TW {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
        
        public final class DynamicBehaviorService : ServiceType, Group_TW {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
        
      }
    }
  }
  
  public enum KR {
    public enum Contexts {
      public struct LoggedOut : ContextType, Group_KR {
        public let resolvedEnv: ResolvedEnv
        public let stack: Stacks.LoggedOut
      }
      
      public struct LoggedIn : ContextType, Group_KR {
        public let resolvedEnv: ResolvedEnv
        public let stack: Stacks.LoggedIn
      }
    }
    
    public enum Stacks {
      public final class LoggedOut : Stack_Global_LoggedOut, Group_KR {
        
        public var mainService: Service_Global_LoggedOut_Main {
          return _mainService
        }
        
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let _mainService: Services.LoggedOut.Main
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedOut.Main
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self._mainService = mainService
        }
      }
      
      public final class LoggedIn : Stack_Global_LoggedIn, Group_KR {
        
        public var mainService: Service_Global_LoggedIn_Main {
          return _mainService
        }
        
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let _mainService: Services.LoggedIn.Main
        public let behaviorService: Services.LoggedIn.DynamicBehaviorService
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedIn.Main,
          behaviorService: Services.LoggedIn.DynamicBehaviorService
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self._mainService = mainService
          self.behaviorService = behaviorService
        }
        
      }
    }
    
    public enum Services {
      
      public enum LoggedOut {
        public final class Main : Service_Global_LoggedOut_Main, Group_KR {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
      }
      
      public enum LoggedIn {
        
        public final class Main : Service_Global_LoggedIn_Main, Group_KR {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
        
        public final class DynamicBehaviorService : ServiceType, Group_KR {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
        
      }
    }
  }
  
  public enum JP {
    public enum Contexts {
      public struct LoggedOut : ContextType, Group_JP {
        public let resolvedEnv: ResolvedEnv
        public let stack: Stacks.LoggedOut
      }
      
      public struct LoggedIn : ContextType, Group_JP {
        public let resolvedEnv: ResolvedEnv
        public let stack: Stacks.LoggedIn
      }
    }
    
    public enum Stacks {
      public final class LoggedOut : StackType, Group_JP {
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let mainService: Services.LoggedOut.Main
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedOut.Main
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self.mainService = mainService
        }
      }
      
      public final class LoggedIn : StackType, Group_JP {
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let mainService: Services.LoggedIn.Main
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedIn.Main
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self.mainService = mainService
        }
        
      }
    }
    
    public enum Services {
      
      public enum LoggedOut {
        public final class Main : ServiceType, Group_JP {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
      }
      
      public enum LoggedIn {
        
        public final class Main : ServiceType, Group_JP {
          public let resolvedEnv: ResolvedEnv
          public let persistentStore: PersistentStore
          
          init(
            resolvedEnv: ResolvedEnv,
            persisitentStore: PersistentStore
            ) {
            self.resolvedEnv = resolvedEnv
            self.persistentStore = persisitentStore
          }
        }
        
      }
    }
  }
}

extension Service_Global_LoggedIn_Main {
  
  func fetchMe() {
    
  }
  
}

extension Groups.JP.Services.LoggedIn.Main {
  
  func japan() {

  }
}


indirect public enum Context<LoggedInContext: ContextType, LoggedOutContext: ContextType> {
  case loggedIn(LoggedInContext)
  case loggedOut(LoggedOutContext)
}

extension Context : Group_JP where LoggedInContext : Group_JP, LoggedOutContext : Group_JP {}
extension Context : Group_TW where LoggedInContext : Group_TW, LoggedOutContext : Group_TW {}
extension Context : Group_KR where LoggedInContext : Group_KR, LoggedOutContext : Group_KR {}

indirect public enum AllGroup<JP: Group_JP, TW: Group_TW, KR: Group_KR> {
  case jp(JP)
  case tw(TW)
  case kr(KR)
  
  init(jp: JP) {
    self = .jp(jp)
  }
  
  init(tw: TW) {
    self = .tw(tw)
  }
  
  init(kr: KR) {
    self = .kr(kr)
  }
}

public typealias AnyContext = AllGroup<
  Context<Groups.JP.Contexts.LoggedIn, Groups.JP.Contexts.LoggedOut>,
  Context<Groups.TW.Contexts.LoggedIn, Groups.TW.Contexts.LoggedOut>,
  Context<Groups.KR.Contexts.LoggedIn, Groups.KR.Contexts.LoggedOut>
>

public typealias LoggedInAnyGroup = AllGroup<
  Groups.JP.Contexts.LoggedIn,
  Groups.TW.Contexts.LoggedIn,
  Groups.KR.Contexts.LoggedIn
>

public typealias LoggedOutAnyGroup = AllGroup<
  Groups.JP.Contexts.LoggedOut,
  Groups.TW.Contexts.LoggedOut,
  Groups.KR.Contexts.LoggedOut
>

indirect public enum OldGLGroup<TW: Group_TW, KR: Group_KR> {
  case tw(TW)
  case kr(KR)
  
  init(tw: TW) {
    self = .tw(tw)
  }
  
  init(kr: KR) {
    self = .kr(kr)
  }
  
  func resolveTW() -> ExactGroup<TW>? {
    guard case .tw(let object) = self else { return nil }
    return ExactGroup<TW>(object)
  }
  
  func resolveKR() -> ExactGroup<KR>? {
    guard case .kr(let object) = self else { return nil }
    return ExactGroup<KR>(object)
  }
}

extension OldGLGroup : ContextType where TW : ContextType, KR : ContextType {}

public struct ExactGroup<Group> {
  
  let body: Group
  
  init(_ group: Group) {
    self.body = group
  }
  
}

public enum GroupResolver {
  
  public static func resolve() -> AnyContext {
    fatalError()
  }
}

public typealias GLGroupContext = OldGLGroup<
  Context<Groups.TW.Contexts.LoggedIn, Groups.TW.Contexts.LoggedOut>,
  Context<Groups.KR.Contexts.LoggedIn, Groups.KR.Contexts.LoggedOut>
>

extension GLGroupContext {
  public func asContext() -> Context<
    GLLoggedInContext,
    GLLoggedOutContext
    > {
      
      switch self {
      case .kr(let kr):
        switch kr {
        case .loggedIn(let loggedIn):
          return .loggedIn(GLLoggedInContext.init(kr: loggedIn))
        case .loggedOut(let loggedOut):
          return .loggedOut(GLLoggedOutContext.init(kr: loggedOut))
        }
      case .tw(let tw):
        switch tw {
        case .loggedIn(let loggedIn):
          return .loggedIn(GLLoggedInContext.init(tw: loggedIn))
        case .loggedOut(let loggedOut):
          return .loggedOut(GLLoggedOutContext.init(tw: loggedOut))
        }
      }
  }
}

public typealias JPGroupContext = JPGroup<
  Context<Groups.JP.Contexts.LoggedIn, Groups.JP.Contexts.LoggedOut>
>

extension AnyContext {
  
  public func resolveJP() -> JPGroupContext? {
    guard case .jp(let c) = self else { return nil }
    return JPGroupContext(c)
  }
  
  public func resolveGL() -> GLGroupContext? {
    switch self {
    case .jp(let _):
      return nil
    case .tw(let tw):
      return GLGroupContext(tw: tw)
    case .kr(let kr):
      return GLGroupContext(kr: kr)
    }
  }
}

public typealias JPGroup<Group: Group_JP> = ExactGroup<Group>

public typealias GLLoggedInContext = OldGLGroup<Groups.TW.Contexts.LoggedIn, Groups.KR.Contexts.LoggedIn>
public typealias GLLoggedOutContext = OldGLGroup<Groups.TW.Contexts.LoggedOut, Groups.KR.Contexts.LoggedOut>

extension GLLoggedInContext {
  public var stack: Stack_Global_LoggedIn {
    switch self {
    case .kr(let kr):
      return kr.stack
    case .tw(let tw):
      return tw.stack
    }
  }
}

extension GLLoggedOutContext {
  public var stack: Stack_Global_LoggedOut {
    switch self {
    case .kr(let kr):
      return kr.stack
    case .tw(let tw):
      return tw.stack
    }
  }
}

public typealias JPLoggedInContext = JPGroup<Groups.JP.Contexts.LoggedIn>
public typealias JPLoggedOutContext = JPGroup<Groups.JP.Contexts.LoggedIn>

//let resolved = GroupResolver.resolve()

class MainViewController {
  
  init(context: AnyContext) {
    
    if let jp = context.resolveJP() {
      
      return
    }
    
    if let gl = context.resolveGL() {
      switch gl.asContext() {
      case .loggedIn(let loggedIn):
        GLLoggedInViewController(context: loggedIn)
      case .loggedOut(let loggedOut):
        GLLoggedOutViewController(context: loggedOut)
      }
      return
    }
    
  }
}

class GLLoggedOutViewController {
  
  init(context: GLLoggedOutContext) {
    context.stack.mainService
  }
}


class GLLoggedInViewController {
  
  init(context: GLLoggedInContext) {
    context.stack.mainService.fetchMe()
    
    switch context {
    case .kr(let kr):
      let _ = KRViewController(context: kr)
    case .tw(let tw):
      let _ = TWViewController(context: tw)
    }
  }
}

class JPViewController {
  init(context: Groups.JP.Contexts.LoggedIn) {
    context.stack.mainService.japan()
  }
}

class TWViewController {
  init(context: Groups.TW.Contexts.LoggedIn) {
    context.stack.mainService.fetchMe()
  }
}

class KRViewController {
  init(context: Groups.KR.Contexts.LoggedIn) {
    context.stack.mainService.fetchMe()
  }
}


