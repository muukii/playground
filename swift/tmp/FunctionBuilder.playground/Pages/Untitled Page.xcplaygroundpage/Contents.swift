public protocol ContainerType {}

extension Int : ContainerType {}

public struct Container : ContainerType {}

@_functionBuilder
public struct BlockAdder {
  public static func buildBlock() -> ContainerType {
    Container.init()
  }
  public static func buildBlock(_ a: ContainerType) -> ContainerType {
    Container.init()
  }
  public static func buildBlock(_ a: ContainerType...) -> ContainerType {
    Container.init()
  }
  public static func buildIf(_ content: ContainerType?) -> ContainerType {
   Container.init()
  }
  public static func buildEither(first: ContainerType) -> ContainerType {
    Container.init()
  }
  public static func buildEither(second: ContainerType) -> ContainerType {
    Container.init()
  }
}

func blockAdd(@BlockAdder block: () -> ContainerType) -> ContainerType {
  return block()
}

let three = blockAdd {
  if true {
    3
  } else {
    5
  }
}
print(three)
