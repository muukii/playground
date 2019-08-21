//: Playground - noun: a place where people can play


indirect enum Node<T> {

  case empty
  case node(T, Node, Node)
}

let tree = Node.node(
  1,
  .node(2,
        .node(3,
              .empty,
              .node(5,
                    .empty,
                    .empty
          )
    ),
        .empty), .node(2, .empty, .empty))

var currenNode: Node<Int> = tree

while case .node = currenNode {
  switch currenNode {
  case .empty:
    break
  case let .node(a, b, c):
    print(a)
    currenNode = b
  }
}
