//
//  ViewController.swift
//  SimpleModal
//
//  Created by muukii on 2019/06/03.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func didTap(_ sender: Any) {
    let controller = UIViewController()
    controller.view.backgroundColor = .gray
    let navigation = UINavigationController(rootViewController: controller)
    navigation.modalPresentationStyle = .pageSheet
    print(navigation.presentationController)
    present(navigation, animated: true)
  }
  
}

