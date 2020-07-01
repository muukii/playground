import SwiftUI
import Combine

class Store: ObservableObject {
  
  let age = 20
  
  var name = "" {
    didSet {
      print("Updated", name)
    }
  }
  
}

let observedStore = ObservedObject.init(initialValue: Store())

/// Can not get age as Binding<Int>, age is constant.
/**
  public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
 */
//observedStore.projectedValue.age

let ageBinder: Binding<String> = observedStore.projectedValue.name

ageBinder.wrappedValue = "Hello"

observedStore.wrappedValue.name

