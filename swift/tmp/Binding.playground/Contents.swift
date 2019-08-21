import SwiftUI
import Combine

final class ViewModel : BindableObject {
  
  var didChange: PassthroughSubject<ViewModel, Never> = .init()
  
  struct State {
    var a: Int = 0
    var b: Int = 0
    var c: Int = 0
  }
  
  private(set) var state: State = .init() {
    didSet {
      didChange.send(self)
    }
  }
  
  init() {
    
  }
}

let vm = ViewModel()

final class CellModel : BindableObject {
  
  var didChange: PassthroughSubject<CellModel, Never> = .init()
  
  struct State {
    
  }
  
  private(set) var state: State = .init() {
    didSet {
      didChange.send(self)
    }
  }
  
  init() {
    
  }
}

