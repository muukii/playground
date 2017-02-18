//: [Previous](@previous)

/*:
 # Adapter - ServiceStack <-> ViewModel
 */

import Foundation

typealias Users = Void

class UserService {

  func fetchA() -> Users {

  }

  func fetchB() -> Users {

  }

  func fetchC() -> Users {

  }

  func fetchD() -> Users {

  }

}

class ServiceStack {

  let userService: UserService = .init()
}


protocol UserListViewModelAdapterType {

  func fetchA() -> Users
  func fetchB() -> Users
}


class UserListViewModel {

  let adapter: UserListViewModelAdapterType

  init(adapter: UserListViewModelAdapterType) {
    self.adapter = adapter
  }

  func refresh() {

    adapter.fetchA()
  }

  func next() {

    adapter.fetchB()
  }
}


/*:
 ### In Production
 */

do {

  class UserListViewModelAdapter: UserListViewModelAdapterType {

    let serviceStack: ServiceStack

    init(serviceStack: ServiceStack) {
      self.serviceStack = serviceStack
    }

    func fetchA() {
      serviceStack.userService.fetchA()
    }

    func fetchB() {
      serviceStack.userService.fetchB()
    }
  }

  let serviceStack = ServiceStack()

  let productionViewModel = UserListViewModel(adapter: UserListViewModelAdapter(serviceStack: serviceStack))
}

/*:
 
 ### In Test

 */

do {

  class MockUserListViewModelAdapter: UserListViewModelAdapterType {

    init() {

    }

    func fetchA() {
      print("fetch")
    }

    func fetchB() {
      print("fetch")
    }
  }

  let serviceStack = ServiceStack()
  let testViewModel = UserListViewModel(adapter: MockUserListViewModelAdapter())
  
}


//: [Next](@next)
