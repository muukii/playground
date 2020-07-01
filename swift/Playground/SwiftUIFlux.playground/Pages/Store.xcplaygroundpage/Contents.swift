
import Foundation

class Dependency {
  
}

struct AppState {
  
  struct Feed {
    var items: [String] = []
  }
  
  struct Search {
    var items: [String] = []

  }
  
  struct Notification {
    var items: [String] = []

  }
  
  var name: String = ""

  var feed: Feed = .init()
  var search: Search = .init()
  var notification: Notification = .init()
}

struct AppOperations: OperationsType {
  typealias TargetState = AppState
  
  private let dep: Dependency
  
  init(dep: Dependency) {
    self.dep = dep
  }
  
  func fetch() -> Action<Void> {
    .init { context in
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        context.dispatch { $0.setName("Delayed Name") }
      }
    }
  }
  
  func setName(_ name: String) -> Mutation {
    .init {
      $0.name = name
    }
  }
}

let dep = Dependency()

let store = Store(
  state: AppState(),
  operations: AppOperations(dep: dep)
)

struct FeedOperations: OperationsType {
  typealias TargetState = AppState.Feed

  func addFeedItem() -> Mutation {
    .init {
      $0.items += ["Add"]
    }
  }
}

let feedStore = store.makeScoped(scope: \.feed, operations: FeedOperations())

store.dispatch { $0.fetch() }
store.dispatch { $0.setName("I'm Muukii") }

print(store.state)
print(feedStore.state)


feedStore.dispatch { $0.addFeedItem() }

print(store.state)
print(feedStore.state)
