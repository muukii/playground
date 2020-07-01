import Foundation

struct Wrapper: Hashable {
  var groups: [BookGroup] = []
}

struct BookGroup: Hashable {
  
  var name: String
  var books: [Book] = []
}

struct Book: Hashable {
  
  var name: String
  var author: Author
}

struct Author: Hashable {
  
  var name: String
}

let authorA = Author(name: "Author-A")
let authorB = Author(name: "Author-B")
let authorC = Author(name: "Author-C")

let groupA = BookGroup(name: "A", books: [
  Book(name: "A-Book-1", author: authorA),
  Book(name: "A-Book-2", author: authorA),
  Book(name: "A-Book-3", author: authorB)
])
let groupB = BookGroup(name: "B", books: [
  Book(name: "B-Book-1", author: authorC),
  Book(name: "B-Book-2", author: authorA),
  Book(name: "B-Book-3", author: authorB)
])
let groupC = BookGroup(name: "C", books: [
  Book(name: "C-Book-1", author: authorA),
  Book(name: "C-Book-2", author: authorC),
  Book(name: "C-Book-3", author: authorB)
])

let wrapper = Wrapper(groups: [groupA, groupB, groupC])

