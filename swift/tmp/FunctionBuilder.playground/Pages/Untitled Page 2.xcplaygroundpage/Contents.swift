public protocol ContainerType {}

@_functionBuilder
public struct BlockAdder {
  public static func buildBlock() -> Int {
    0
  }
  public static func buildBlock(_ a: Int) -> [Int] {
    [a]
  }
  public static func buildBlock(_ a: Int...) -> [Int] {
    a
  }
  public static func buildIf(_ content: Int?) -> Int {
    0
  }
  public static func buildEither(first: Int) -> Int {
    0
  }
  public static func buildEither(second: Int) -> Int {
    0
  }
}

func blockAdd(@BlockAdder block: () -> [Int]) -> [Int] {
  return block()
}

let three = blockAdd {

  3
//  3
}
print(three)
