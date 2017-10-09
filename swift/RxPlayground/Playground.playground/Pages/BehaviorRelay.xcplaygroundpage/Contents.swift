//: [Previous](@previous)

import RxSwift
import RxCocoa

let b = BehaviorRelay<String>(value: "")

let p = PublishRelay<Void>()

p.accept(())

p.share(replay: 1, scope: .whileConnected)
