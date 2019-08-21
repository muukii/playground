
enum Before {
  struct Author {
    let id: Int
    let name: String
    let point: Int
  }

  struct Book {
    let id: Int
    let title: String
    let tags: [String]
    let author: Author
  }
}

struct Author {
  let id: Int
  let name: String
  let point: Int
}

struct Book {
  let id: Int
  let title: String
  let tags: [String]
  let authorID: Int
}


var storage: [AnyHashable : Any] = [:]

let author = Author(id: 0, name: "muukii", point: 2)
let book = Book(id: 0, title: "AAA Book", tags: [], authorID: author.id)

storage[AnyHashable("Author.\(author.id)")] = author
storage[AnyHashable("Book.\(book.id)")] = book

storage[AnyHashable("Author.\(book.authorID)")]



