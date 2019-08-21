
import Foundation

public struct Progress {

  public var fractionCompleted: CGFloat

  public init(_ fractionCompleted: CGFloat) {
    precondition(fractionCompleted >= 0 && fractionCompleted <= 1)
    self.fractionCompleted = fractionCompleted
  }
}

public struct CalcBox<T> {

  public var value: T

  public init(_ value: T) {
    self.value = value
  }
}

extension CalcBox where T == CGFloat {

  public func clip(min: CGFloat, max: CGFloat) -> CalcBox<CGFloat> {
    return .init(Swift.max(Swift.min(value, max), min))
  }

  public func progress(start: CGFloat, end: CGFloat) -> CalcBox<Progress> {
    return .init(Progress.init((value - start) / (end - start)))
  }
}

extension CalcBox where T == Progress {

  public func reverse() -> CalcBox<Progress> {
    return .init(Progress(1 - value.fractionCompleted))
  }

  public func transition(start: CGFloat, end: CGFloat) -> CalcBox<CGFloat> {
    return .init(((end - start) * value.fractionCompleted) + start)
  }
}

extension CalcBox where T == CGPoint {

  public func vector() -> CalcBox<CGVector> {
    return .init(CGVector(dx: value.x, dy: value.y))
  }

  public func distance(from: CGPoint) -> CalcBox<CGFloat> {
    return .init(sqrt(pow(value.x - from.x, 2) + pow(value.y - from.y, 2)))
  }

  public func distance(to: CGPoint) -> CalcBox<CGFloat> {
    return .init(sqrt(pow(to.x - value.x, 2) + pow(to.y - value.y, 2)))
  }
}

extension CalcBox where T == CGVector {
  public func magnitude() -> CGFloat {
    return sqrt(pow(value.dx, 2) + pow(value.dy, 2))
  }
}

CalcBox.init(10.0)
  .clip(min: 4, max: 11)
  .progress(start: 9, end: 12)

