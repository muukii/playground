
let numbers = [1,2,2,4,5,2,3,6,7,2,2,2,4,5,67,8,4,2,5]

extension RandomAccessCollection {
  
  public func distinct<H : Hashable>(keySelector: (Element) -> H) -> Array<Element> {
    
    var set = Set<H>.init([])
    
    return
      filter { e -> Bool in
        let (inserted, _) = set.insert(keySelector(e))
        return inserted
    }
  }
}

extension RandomAccessCollection where Element : Hashable {
  
  public func distinct() -> Array<Element>  {
    return distinct(keySelector: { $0 })
  }
}

extension Collection {
  
  public func distinct(comparer: (Element, Element) -> Bool) -> Array<Element> {
    
    let source = self
    var dist = Array<Element>()
    
    for i in source {
      guard !dist.contains(where: { comparer(i, $0) }) else { continue }
      dist.append(i)
    }
    return dist
  }
  
}


let result = numbers.distinct(keySelector: {$0})
let r = numbers.distinct(comparer: { $0 == $1 })
print (r)
print(result)


