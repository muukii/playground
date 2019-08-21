//
//  TargetViewController.swift
//  Modal
//
//  Created by muukii on 2019/01/23.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

final class TargetViewController : UIViewController {
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    print("modalPresentationStyle", modalPresentationStyle.rawValue)
    print("definesPresentationContext", definesPresentationContext)
    print("providesPresentationContextTransitionStyle", providesPresentationContextTransitionStyle)
    print("presentingViewController", presentingViewController as Any)
    print("presentingViewController.definesPresentationContext", presentingViewController?.definesPresentationContext)

  }
}
