import Foundation

import Combine

// Subscriber / Publisher
public final class Buffer<Input, Output> {
  
  private var didUpdates: [(Output) -> Void] = []
  
  var onDeinit: () -> Void = {}
  
  var value: Output
  private let map: (Input) -> Output
  private let filter: (Input) -> Bool
  private let ratainUpstream: () -> Void
  
  init(
    input: Input,
    filter: @escaping (Input) -> Bool,
    map: @escaping (Input) -> Output
  ) {
    
    self.map = map
    self.value = map(input)
    self.filter = filter
    self.ratainUpstream = {}
  }
  
  init<UpstreamInput>(
    upstream: Buffer<UpstreamInput, Input>,
    filter: @escaping (Input) -> Bool,
    map: @escaping (Input) -> Output
  ) {
    
    self.value = map(upstream.value)
    self.map = map
    self.filter = filter
    
    self.ratainUpstream = {
      withExtendedLifetime(upstream) {}
    }
    
    upstream.subscribe { [weak self] value in
      self?._receive(newValue: value)
    }
  }
  
  deinit {
    onDeinit()
  }
  
  func _receive(newValue: Input) {
    guard !filter(newValue) else { return }
    value = map(newValue)
    didUpdates.forEach {
      $0(value)
    }
  }
  
  func subscribe(_ closure: @escaping (Output) -> Void) {
    didUpdates.append(closure)
  }
  
}

let a = Buffer<String, String>(input: "Hello", filter: { _ in true }, map: { $0 })

let b = Buffer<String, Int>.init(upstream: a, filter: { _ in true }, map: { $0.count })

a._receive(newValue: "M")
b.value
