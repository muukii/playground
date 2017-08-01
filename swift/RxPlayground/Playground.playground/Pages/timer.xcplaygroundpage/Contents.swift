//: [Previous](@previous)

import Foundation
import RxSwift

struct AlertModel {

}

class ViewModel {

  let alertModel: Observable<AlertModel?>

  init() {

    let o = Observable<AlertModel>.create { o in

      print("Begin Request")
      // API request
      o.onNext(AlertModel())

      return Disposables.create()
      }
      .replay(1)

    o.connect()

    self.alertModel = o

  }
  
}


let vm = ViewModel()

vm.alertModel.debug().subscribe()

print("end")



//: [Next](@next)
