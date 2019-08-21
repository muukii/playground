public class BloomFilter<T : Hashable> {
  private var array: [Bool]

  public init(size: Int = 1024) {
    self.array = [Bool](repeating: false, count: size)
  }

  private func computeHashes(_ value: T) -> Int {
    return abs(value.hashValue % array.count)
  }

  public func insert(_ element: T) {
    array[computeHashes(element)] = true
    print(array)
  }

  public func insert(_ values: [T]) {
    for value in values {
      insert(value)
    }
  }

  public func query(_ value: T) -> Bool {
    let hashValue = computeHashes(value)

    // Map hashes to indices in the Bloom Filter
    let results = array[hashValue]

    return results
  }

  public func isEmpty() -> Bool {
    // As soon as the reduction hits a 'true' value, the && condition will fail.
    return array.reduce(true) { prev, next in prev && !next }
  }
}

struct Body : Hashable {

  var name: String

  init(_ value: String) {
    self.name = value
  }

}

let filter = BloomFilter<Body>(size: 1024)

for i in 0..<100 {
  filter.insert(Body("Foo\(i)"))
}

filter.query(Body("Hoge"))
filter.query(Body("Hoge2"))
