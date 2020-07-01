import Cocoa

let items = [1,2,3,4,5,6]

let c = AnyRandomAccessCollection<Int>(
  items.lazy.map {
    print("call")
    return $0 * 2
})

c[AnyIndex(1)]
c[AnyIndex(2)]
