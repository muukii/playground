//
//  CycleViewModel.swift
//  AppLibrary
//
//  Created by muukii on 9/5/17.
//  Copyright © 2017 eure. All rights reserved.
//

import RxSwift
import RxCocoa

public enum NoState {}
public enum NoActivity {}
public enum NoMutation {}
public enum NoAction {}

public protocol CycleViewModel : class {

  associatedtype State
  associatedtype Activity
  associatedtype Action
  associatedtype Mutation

  var activity: Signal<Activity> { get }
  var state: StateStorage<State> { get }
  func mutate(_ action: Action) -> Mutation
  func reduce(_ mutation: Mutation)
}

extension CycleViewModel where Action == Mutation {
  public func mutate(_ action: Action) -> Mutation {
    return action
  }
}

extension CycleViewModel where Activity == NoActivity {
  public var activity: Signal<Activity> {
    preconditionFailure("\(self) does not have Activity")
  }
}

extension CycleViewModel where State == NoState {
  public var state: StateStorage<State> {
    preconditionFailure("\(self) does not have State")
  }
}

extension CycleViewModel where Action == NoAction, Mutation == NoMutation {

  public func mutate(_ action: Action) -> Mutation {
    preconditionFailure("\(self) does not have Action")
  }

  public func reduce(_ mutation: Mutation) {
    preconditionFailure("\(self) does not have Mutation")
  }
}

extension CycleViewModel {

  public var action: Binder<Action> {
    return Binder<Action>.init(self) { (t, a) in
      t.reduce(self.mutate(a))
    }
  }

  public func run(_ action: Action) {
    self.reduce(self.mutate(action))
  }
}

public final class StateStorage<T> {

  public var value: T {
    return source.value
  }

  private let source: MutableStateStorage<T>

  public init(_ variable: MutableStateStorage<T>) {
    self.source = variable
  }

  public func asObservable() -> Observable<T> {
    return source.asObservable()
  }

  public func asDriver() -> Driver<T> {
    return source.asDriver()
  }
}

public final class MutableStateStorage<T> {

  public var value: T {
    get {
      return source.value
    }
    set {
      source.accept(newValue)
    }
  }

  private let source: BehaviorRelay<T>

  public init(_ value: T) {
    self.source = .init(value: value)
  }

  public func mutate<Source: ObservableType>(_ execute: @escaping (inout T, Source.E) -> Void) -> (Source) -> Disposable {
    return { source in
      source
        .do(onNext: { [weak self] e in
          guard let `self` = self else { return }
          execute(&self.value, e)
        })
        .subscribe()
    }
  }

  public func asObservable() -> Observable<T> {
    return source.asObservable()
  }

  public func asDriver() -> Driver<T> {
    return source.asDriver()
  }
}

