
public protocol CachedMapping {
  associatedtype MappingKey : Hashable
  var mappingKey: MappingKey { get }
}

public final class CacheStorage<Source : CachedMapping, Target> {

  private var innerStorage: [Source.MappingKey : Target] = [:]

  public init() {

  }

  public func purgeCache() {
    innerStorage = [:]
  }

  public func map<C: Collection>(from collection: C, transform: (C.Element) throws -> Target) rethrows -> [Target] where C.Element == Source {
    return
      try collection.map { (element) -> Target in
        if let cached = innerStorage[element.mappingKey] {
          return cached
        }
        let newObject = try transform(element)
        innerStorage[element.mappingKey] = newObject
        return newObject
    }
  }

  public func compactMap<C: Collection>(from collection: C, transform: (C.Element) throws -> Target?) rethrows -> [Target] where C.Element == Source {
    return
      try collection.compactMap { (element) -> Target? in
        if let cached = innerStorage[element.mappingKey] {
          return cached
        }
        guard let newObject = try transform(element) else { return nil }
        innerStorage[element.mappingKey] = newObject
        return newObject
    }
  }
}

extension Collection where Self.Element : CachedMapping {

  public func cachedMap<U>(storage: CacheStorage<Self.Element, U>, _ transform: (Self.Element) throws -> U) rethrows -> [U] {
    return try storage.map(from: self, transform: transform)
  }

  public func cachedCompactMap<U>(storage: CacheStorage<Self.Element, U>, _ transform: (Self.Element) throws -> U?) rethrows -> [U] {
    return try storage.compactMap(from: self, transform: transform)
  }
}

/*:

 Demo:

 */

extension Int : CachedMapping {
  var mappingKey: Int { return self }
}

struct Object {
  let value: Int

  init(value: Int) {
    print("init", value)
    self.value = value
  }
}

let storage = CacheStorage<Int, Object>()

let source = 0..<10

storage.map(from: source, transform: { Object.init(value: $0) })

let newSource = 5..<15

storage.map(from: newSource, transform: { Object.init(value: $0) })

