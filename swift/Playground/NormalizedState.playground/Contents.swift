import Foundation

protocol DatabaseType {
  
}

typealias Table<Entity: Identifiable> = [Entity.ID : Entity]

final class Normalizer<Database: DatabaseType> {
    
  init(target database: Database) {
    
  }
  
  func update() {
    
  }
  
}

final class NormalizerContext<Entity: Identifiable> {
  
}

struct Post: Identifiable {
  var id: String
  var commentIDs: Set<Comment.ID> = .init()
}

struct Comment: Identifiable {
  var id: String
  var postID: Post.ID
}

struct Database: DatabaseType {
  
  var posts: Table<Post> = .init()
  var comments: Table<Comment> = .init()
}

struct RootState {
  
  var entites: Database = .init()
  
}

let rootState = RootState()

let normalizer = Normalizer.init(target: rootState.entites)
