import Foundation

public protocol Group_JP {}

public protocol Group_TW {}

public protocol Group_KR {}

public protocol ContextType {
  
}

public protocol StackType {
  
}

public protocol ServiceType {
  
}

public protocol Service_Global_LoggedIn: ServiceType {
  
}

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
      public final class LoggedOut : StackType, Group_TW {
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
      
      public final class LoggedIn : StackType, Group_TW {
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let mainService: Services.LoggedIn.Main
        public let behaviorService: Services.LoggedIn.DynamicBehaviorService
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedIn.Main,
          behaviorService: Services.LoggedIn.DynamicBehaviorService
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self.mainService = mainService
          self.behaviorService = behaviorService
        }
        
      }
    }
    
    public enum Services {
      
      public enum LoggedOut {
        public final class Main : ServiceType, Group_TW {
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
        
        public final class Main : Service_Global_LoggedIn, Group_TW {
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
      public final class LoggedOut : StackType, Group_KR {
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
      
      public final class LoggedIn : StackType, Group_KR {
        public let resolvedEnv: ResolvedEnv
        public let persistentStore: PersistentStore
        public let mainService: Services.LoggedIn.Main
        public let behaviorService: Services.LoggedIn.DynamicBehaviorService
        
        init(
          resolvedEnv: ResolvedEnv,
          persistentStore: PersistentStore,
          mainService: Services.LoggedIn.Main,
          behaviorService: Services.LoggedIn.DynamicBehaviorService
          ) {
          self.resolvedEnv = resolvedEnv
          self.persistentStore = persistentStore
          self.mainService = mainService
          self.behaviorService = behaviorService
        }
        
      }
    }
    
    public enum Services {
      
      public enum LoggedOut {
        public final class Main : ServiceType, Group_KR {
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
        
        public final class Main : Service_Global_LoggedIn, Group_KR {
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

extension Service_Global_LoggedIn {
  
  func fetchMe() {
    
  }
  
}

public enum Context<LoggedInContext: ContextType, LoggedOutContext: ContextType> {
  case loggedIn(LoggedInContext)
  case loggedOut(LoggedOutContext)
}

extension Context : Group_JP where LoggedInContext : Group_JP, LoggedOutContext : Group_JP {}
extension Context : Group_TW where LoggedInContext : Group_TW, LoggedOutContext : Group_TW {}
extension Context : Group_KR where LoggedInContext : Group_KR, LoggedOutContext : Group_KR {}

public enum AllGroup<JP: Group_JP, TW: Group_TW, KR: Group_KR> {
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

typealias AnyContext = AllGroup<
  Context<Groups.JP.Contexts.LoggedIn, Groups.JP.Contexts.LoggedOut>,
  Context<Groups.TW.Contexts.LoggedIn, Groups.TW.Contexts.LoggedOut>,
  Context<Groups.KR.Contexts.LoggedIn, Groups.KR.Contexts.LoggedOut>
>

typealias LoggedInAnyGroup = AllGroup<
  Groups.JP.Contexts.LoggedIn,
  Groups.TW.Contexts.LoggedIn,
  Groups.KR.Contexts.LoggedIn
>

typealias LoggedOutAnyGroup = AllGroup<
  Groups.JP.Contexts.LoggedOut,
  Groups.TW.Contexts.LoggedOut,
  Groups.KR.Contexts.LoggedOut
>

public enum OldGLGroup<TW: Group_TW, KR: Group_KR> {
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

public enum ExactGroup<Group> {
  
  case target(Group)
  
  init(_ group: Group) {
    self = .target(group)
  }
}

public enum GroupResolver {
  
  static func resolve() -> AnyContext {
    fatalError()
  }
}

typealias GLGroupContext = OldGLGroup<
  Context<Groups.TW.Contexts.LoggedIn, Groups.TW.Contexts.LoggedOut>,
  Context<Groups.KR.Contexts.LoggedIn, Groups.KR.Contexts.LoggedOut>
>

extension GLGroupContext {
  func asContext() -> Context<
    GLLoggedInContext,
    GLLoggedOutContext
    > {
      switch self {
      case .kr(let kr):
        switch kr {
        case .loggedIn(let loggedIn):
          return .loggedIn(.kr(loggedIn))
        case .loggedOut(let loggedOut):
          return .loggedOut(.kr(loggedOut))
        }
      case .tw(let tw):
        switch tw {
        case .loggedIn(let loggedIn):
          return .loggedIn(l.tw(oggedIn))
        case .loggedOut(let loggedOut):
          return .loggedOut(.tw(loggedOut))
        }
      }
  }
}

typealias JPGroupContext = JPGroup<
  Context<Groups.JP.Contexts.LoggedIn, Groups.JP.Contexts.LoggedOut>
>

extension AnyContext {
  
  func resolveJP() -> JPGroupContext? {
    guard case .jp(let c) = self else { return nil }
    return JPGroupContext(c)
  }
  
  func resolveGL() -> GLGroupContext? {
    switch context {
    case .jp(let jp):
      return nil
    case .tw(let tw):
      return GLGroupContext(tw)
    case .kr(let kr):
      return GLGroupContext(kr)
    }
  }
}

typealias JPGroup<Group: Group_JP> = ExactGroup<Group>

typealias GLLoggedInContext = OldGLGroup<Groups.TW.Contexts.LoggedIn, Groups.KR.Contexts.LoggedIn>
typealias GLLoggedOutContext = OldGLGroup<Groups.TW.Contexts.LoggedIn, Groups.KR.Contexts.LoggedIn>

typealias JPLoggedInContext = JPGroup<Groups.JP.Contexts.LoggedIn>
typealias JPLoggedOutContext = JPGroup<Groups.JP.Contexts.LoggedIn>

//let resolved = GroupResolver.resolve()

class MainViewController {
  
  init(context: AnyContext) {
    
    if let jp = context.resolveJP() {
      
      return
    }
    
    if let gl = context.resolveGL() {
      
      return
    }
    
  }
}

class GLViewController {
  
  init(context: GLLoggedInContext) {
    
  }
}

class JPViewController {
  
}

class TWViewController {
  
}

class KRViewController {
  
}

