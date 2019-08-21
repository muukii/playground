
import Foundation

class ViewController {

  private lazy var p = Presenter { [weak self] action in

    guard let `self` = self else { return }

    switch action {
    case .reloadData:
      break
    case .pushDetailView(let userID):
      break
    }
  }

  func viewDidLoad() {
    p.foo()
  }
}

enum ViewAction {
  case reloadData
  case pushDetailView(userID: Int)
}

class Presenter {

  private let action: (ViewAction) -> Void
  init(action: @escaping (ViewAction) -> Void) {
    self.action = action
  }

  func foo() {
    action(.pushDetailView(userID: 10))
  }
}
