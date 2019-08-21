
public enum Result<Success, Failure: Error> {
  /// A success, storing a `Success` value.
  case success(Success)
  
  /// A failure, storing a `Failure` value.
  case failure(Failure)
  
  public func map<NewSuccess>(
    _ transform: (Success) -> NewSuccess
    ) -> Result<NewSuccess, Failure> {
    switch self {
    case let .success(success):
      return .success(transform(success))
    case let .failure(failure):
      return .failure(failure)
    }
  }
  
  public func mapError<NewFailure>(
    _ transform: (Failure) -> NewFailure
    ) -> Result<Success, NewFailure> {
    switch self {
    case let .success(success):
      return .success(success)
    case let .failure(failure):
      return .failure(transform(failure))
    }
  }
  
  public func flatMap<NewSuccess>(
    _ transform: (Success) -> Result<NewSuccess, Failure>
    ) -> Result<NewSuccess, Failure> {
    switch self {
    case let .success(success):
      return transform(success)
    case let .failure(failure):
      return .failure(failure)
    }
  }
  
  public func flatMapError<NewFailure>(
    _ transform: (Failure) -> Result<Success, NewFailure>
    ) -> Result<Success, NewFailure> {
    switch self {
    case let .success(success):
      return .success(success)
    case let .failure(failure):
      return transform(failure)
    }
  }
  
  
}

extension Result where Failure == Swift.Error {
  
  public init(catching body: () throws -> Success) {
    do {
      self = .success(try body())
    } catch {
      self = .failure(error)
    }
  }
  
  public func get() throws -> Success {
    switch self {
    case let .success(success):
      return success
    case let .failure(failure):
      throw failure
    }
  }
}

extension Result where Failure == Never {
  
  public init(catching body: () -> Success) {
    self = .success(body())
  }
  
  public func get() -> Success {
    switch self {
    case let .success(success):
      return success
    case .failure:
      fatalError()
    }
  }
}


extension Result: Equatable where Success: Equatable, Failure: Equatable { }

extension Result: Hashable where Success: Hashable, Failure: Hashable { }



let r = Result<Int, Never>.success(10)

r.get()

