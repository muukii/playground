//: [Previous](@previous)

import Foundation

struct Model {
  var name: String = ""
}

class CellModel {

  var model: Model

  init(model: Model) {
    self.model = model

    /**
     observe(model) { m in
       self.model = m
     }
     */
  }
}

var models: [Model] = [
  Model(),
  Model(),
  Model(),
]

var cellModels = models.map(CellModel.init)




//: [Next](@next)
