import UIKit
import PlaygroundSupport

print(UIViewAnimatingState.inactive.rawValue)
print(UIViewAnimatingState.active.rawValue)
print(UIViewAnimatingState.stopped.rawValue)

PlaygroundPage.current.needsIndefiniteExecution = true

let view = UIView()

let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
  view.alpha = 0
}

animator.addCompletion { position in
  
  print(position.rawValue)
  
  animator.state.rawValue
  animator.pauseAnimation()
  animator.state.rawValue
}
//animator.pausesOnCompletion
animator.state.rawValue
animator.pauseAnimation()
animator.state.rawValue
//
////animator.continueAnimation(withTimingParameters: nil, durationFactor: 1)
//
//animator.state.rawValue
//
//animator.pauseAnimation()
//animator.state.rawValue
