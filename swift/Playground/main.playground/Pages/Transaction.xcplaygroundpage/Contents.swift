//: [Previous](@previous)

import Foundation

struct Consumption {

  let point: Int = 100
}

struct Transaction {
  let targetUserID: String

  func set(consumption: Consumption) -> ResolvedTransaction {
    return ResolvedTransaction(targetUserID: targetUserID, consumption: consumption)
  }
}

struct ResolvedTransaction {

  let targetUserID: String
  let consumption: Consumption
}

//: [Next](@next)
