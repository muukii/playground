import Foundation

extension Collection where Index == Int {

  fileprivate func concurrentMap<U>(_ transform: (Element) -> U) -> [U] {
    var buffer = [U?].init(repeating: nil, count: count)
    let lock = NSLock()
    DispatchQueue.concurrentPerform(iterations: count) { i in
      let e = self[i]
      let r = transform(e)
      lock.lock()
      buffer[i] = r
      lock.unlock()
    }
    return unsafeBitCast(buffer, to: [U].self)
  }
}

print(1)
(0..<10000).map { String($0) }

print(2)
(0..<10000).concurrentMap { String($0) }

print(3)

DispatchQueue.global().async {
  (0..<10000).concurrentMap { String($0) }
}

print(4)
