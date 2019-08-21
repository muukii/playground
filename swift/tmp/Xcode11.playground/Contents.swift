import Combine


let task = AnyPublisher<Int, Never>.init { (s) in
  s.receive(1)
}





