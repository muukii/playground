//: Playground - noun: a place where people can play

import UIKit

struct Transition {

  let prepare: () -> Void
  let apply: () -> Void
  let complete: () -> Void

  init<T>(
    target: T,
    prepare: @escaping (T) -> Void,
    apply: @escaping (T) -> Void,
    complete: @escaping (T) -> Void = { _ in }
    ) {

    self.prepare = { prepare(target) }
    self.apply = { apply(target) }
    self.complete = { complete(target) }
  }
}

let v = UIView()

extension UIView {

  class func animate(
    withDuration duration: TimeInterval,
    delay: TimeInterval,
    usingSpringWithDamping dampingRatio: CGFloat,
    initialSpringVelocity velocity: CGFloat,
    options: UIViewAnimationOptions = [],
    animations: [Transition],
    completion: ((Bool) -> Swift.Void)? = nil) {

    animations.forEach { $0.prepare() }

    animate(
      withDuration: duration,
      delay: delay,
      usingSpringWithDamping: dampingRatio,
      initialSpringVelocity: velocity,
      animations: {
        animations.forEach { $0.apply() }
    },
      completion: { finish in
        animations.forEach { $0.complete() }
        completion?(finish)
    })
  }

  class func animate(
    withDuration duration: TimeInterval,
    delay: TimeInterval,
    options: UIViewAnimationOptions = [],
    animations: [Transition],
    completion: ((Bool) -> Swift.Void)? = nil) {

    animations.forEach { $0.prepare() }

    animate(
      withDuration: duration,
      delay: delay,
      options: options,
      animations: {
        animations.forEach { $0.apply() }

    },
      completion: { finish in
        animations.forEach { $0.complete() }
        completion?(finish)
    })
  }
}
