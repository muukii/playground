//  UIStackState.swift
//  Copyright © eureka, Inc. All rights reserved.

import Foundation

struct UIStackEmpty : Equatable {}

/// http://scotthurff.com/posts/why-your-user-interface-is-awkward-youre-ignoring-the-ui-stack
enum UIStackState<
  BlankStateType,
  LoadingStateType,
  PartialStateType,
  ErrorStateType,
  IdealStateType
> {
  case blank(BlankStateType)
  case loading(LoadingStateType)
  case partial(PartialStateType)
  case error(ErrorStateType)
  case ideal(IdealStateType)
  
}

extension UIStackState : Equatable where
  BlankStateType : Equatable,
  LoadingStateType : Equatable,
  PartialStateType : Equatable,
  ErrorStateType : Equatable,
  IdealStateType : Equatable
{
  
}

extension UIStackState {
  
  var blankState: BlankStateType? {
    guard case .blank(let state) = self else { return nil }
    return state
  }
  
  var loadingState: LoadingStateType? {
    guard case .loading(let state) = self else { return nil }
    return state
  }
  
  var partialState: PartialStateType? {
    guard case .partial(let state) = self else { return nil }
    return state
  }
  
  var errorState: ErrorStateType? {
    guard case .error(let state) = self else { return nil }
    return state
  }
  
  var idealState: IdealStateType? {
    guard case .ideal(let state) = self else { return nil }
    return state
  }
  
  
  
}



