//
//  RootViewController.swift
//  Modal
//
//  Created by muukii on 2019/01/23.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

final class RootViewController : UITableViewController {
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if let nav = navigationController {
      
      print(nav.definesPresentationContext)
      
      nav.definesPresentationContext = false
      
    }
  }
}
