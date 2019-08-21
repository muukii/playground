//
//  CancellableFuture.swift
//  CombineApp
//
//  Created by muukii on 2019/06/27.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation
import Combine

public final class CancellableFuture<Output, BaseFailure> : Publisher where BaseFailure : Error {
  
  // MARK: - Nested types
  
  public typealias Failure = Error
  
  public enum Error : Swift.Error {
    case wasCancelled
    case underlying(BaseFailure)
  }
  
  public struct Canceller {
    
    private let onCancelled: () -> Void
    
    public init(_ onCancelled: @escaping () -> Void = {}) {
      self.onCancelled = onCancelled
    }
    
    func cancel() {
      onCancelled()
    }
  }
  
  // MARK: - Properties
  
  public var wasCancelled: Bool {
    get {
      wasCancelledLock.lock(); defer { wasCancelledLock.unlock() }
      return wasCancelledStorage
    }
    set {
      wasCancelledLock.lock(); defer { wasCancelledLock.unlock() }
      wasCancelledStorage = newValue
    }
  }
  
  private var backed: Future<Output, Error>!
  
  private let wasCancelledLock = NSLock()
  private let cancellLock = NSLock()
  
  private var wasCancelledStorage: Bool = false
  private var canceller: Canceller?
  private var promise: Future<Output, Error>.Promise?
  
  // MARK: - Initializers
  
  public init(_ attemptToFulfill: @escaping (@escaping Future<Output, BaseFailure>.Promise) -> Canceller) {
    self.backed = .init { promise in
      self.promise = promise
      self.canceller = attemptToFulfill { [weak self] result in
        
        guard let self = self else { return }
        self.cancellLock.lock(); defer { self.cancellLock.unlock() }
        
        guard !self.wasCancelled else {
          self.promise?(.failure(.wasCancelled))
          return
        }
        
        self.promise?(result.mapError { .underlying($0) })
      }
    }
  }
  
  // MARK: - Functions
  
  public func cancel() {
    cancellLock.lock()
    canceller?.cancel()
    promise?(.failure(.wasCancelled))
    promise = nil
    canceller = nil
    cancellLock.unlock()
    wasCancelledStorage = true
  }
  
  /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
  ///
  /// - SeeAlso: `subscribe(_:)`
  /// - Parameters:
  ///     - subscriber: The subscriber to attach to this `Publisher`.
  ///                   once attached it can begin to receive values.
  public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
    backed.receive(subscriber: subscriber)
  }
  
}

