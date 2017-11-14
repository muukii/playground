import RxSwift

print(".whileConnected, if it has subscribers that are subscribing forever")

do {
  let subject = PublishSubject<Int>()

  let s = subject.share(replay: 1, scope: .whileConnected)

  s.subscribe()
  s.debug().take(1).subscribe()

  subject.onNext(1)

  s.debug().subscribe()
}

print(".whileConnected, if all subscribes has been disposed before adding a new subscriber")

do {
  let subject = PublishSubject<Int>()

  let s = subject.share(replay: 1, scope: .whileConnected)

  s.debug().take(1).subscribe()

  subject.onNext(1)

  s.debug().subscribe()
}

print(".forever")

do {
  let subject = PublishSubject<Int>()

  let s = subject.share(replay: 1, scope: .forever)

  s.debug().take(1).subscribe()

  subject.onNext(1)

  s.debug().subscribe()
}

