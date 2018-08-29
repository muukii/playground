//: [Previous](@previous)

import RxSwift

import PlaygroundSupport

struct Image {
  let after: TimeInterval
  init(_ after: TimeInterval) {
    self.after = after
  }
}

func upload(image: Image, completion: @escaping () -> Void) {

  print("Start => \(image)")
  DispatchQueue.global().asyncAfter(deadline: .now() + image.after) {
    print("End => \(image)")
    completion()
  }
}

let images = [Image(1), Image(3), Image(2)]

/*
func runSerial(_ images: [Image]) {
  var images = images
  guard !images.isEmpty else { return }
  let image = images.removeFirst()
  upload(image: image, completion: { [images] in
    runSerial(images)
  })
}

runSerial(images)
 */

/*
var doneCount: Int = 0

images.forEach {
  upload(image: $0, completion: {
    doneCount += 1
    if doneCount == images.count {
      print("done")
    }
  })
}
 */

let queue = DispatchQueue.init(label: "hoge", qos: .default, attributes: [])

let s = DispatchSemaphore(value: 2)
//images.forEach { img in
//  queue.async(group: g, qos: .default, execute: {
//    s.wait()
//    upload(image: img, completion: {
//      s.signal()
//    })
//  })
//}

do {

  func rx_upload(image: Image) -> Single<Void> {

    return Single<Void>.create { o in
      upload(image: image, completion: {
        o(.success(()))
      })
      return Disposables.create()
    }
  }

  let queue = PublishSubject<Single<Void>>()

  queue
//    .debug("Receive")
    .merge()
    .toArray()
    .debug()
//    .merge(maxConcurrent: 1)
//    .debug("Complete")
    .subscribe()

  images.forEach {
    queue.onNext(rx_upload(image: $0))
  }

}

print("Done")

//: [Next](@next)
