//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift
import RxCocoa

PlaygroundPage.current.needsIndefiniteExecution = true

do {
  let s = PublishSubject<Void>()
  
  s.asDriver(onErrorJustReturn: ()).debug().drive()
  
  s.onNext()
  print("on")
}

do {
  
  let v = Variable<Bool>(false)
  
  v.asDriver().debug().drive()
  
  v.value = true
  print("change")
}

//DispatchQueue.global().async {
//  s.onNext()
//  print("on")
//}

//: [Next](@next)
