import RxSwift

class Metadata {
  var visible: Bool = false
}

let metadata = Metadata()

let m = Variable(metadata)

m
  .asObservable()
  .debug()
  .map { $0.visible }
  .distinctUntilChanged()
  .skip(1)
  .debug()
  .subscribe()

metadata.visible = false
m.value = metadata

metadata.visible = true
m.value = metadata


