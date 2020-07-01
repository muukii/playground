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

extension Wrapper {
  func accept(_ visitor: Visitor) {
    visitor.visit(self)
    groups.forEach {
      $0.accept(visitor)
    }
  }
}

extension BookGroup {
  func accept(_ visitor: Visitor) {
    visitor.visit(self)
    books.forEach {
      $0.accept(visitor)
    }
  }
}

extension Book {
  func accept(_ visitor: Visitor) {
    visitor.visit(self)
    author.accept(visitor)
  }
}

extension Author {
  func accept(_ visitor: Visitor) {
    visitor.visit(self)
  }
}

class Visitor {
  
  func visit(_ wraper: Wrapper) {
   
  }
    
  func visit(_ group: BookGroup) {
   
  }
  
  func visit(_ book: Book) {
    
  }
  
  func visit(_ author: Author) {
    
  }
  
}

class SampleVisitor: Visitor {
  
  override func visit(_ wraper: Wrapper) {
    print(wraper)
  }
  
  override func visit(_ group: BookGroup) {
    print(group)
  }
  
  override func visit(_ book: Book) {
    print(book)
  }
  
  override func visit(_ author: Author) {
    print(author)
  }
  
}

class CollectAuthorVisitor: Visitor {
  
  var authors = Set<Author>()
  
  override func visit(_ author: Author) {
    super.visit(author)
    authors.insert(author)
  }
  
}

class CollectBookCountVisitor: Visitor {
  
  var grouping: [Author : [Book]] = [:]
  
  override func visit(_ book: Book) {
    super.visit(book)
    if let fuga = grouping[book.author] {
      grouping[book.author] = fuga + [book]
    } else {
      grouping[book.author] = [book]
    }
  }
    
}

//let authorVisitor = CollectAuthorVisitor()
let countVisitor = CollectBookCountVisitor()
//
//wrapper.accept(authorVisitor)
wrapper.accept(countVisitor)
//
//print(authorVisitor.authors.count)
dump(countVisitor.grouping)
