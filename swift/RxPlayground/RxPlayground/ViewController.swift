//
//  ViewController.swift
//  RxPlayground
//
//  Created by muukii on 3/13/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    Single<Void>.create { observer in
      
      DispatchQueue.global().async {
        observer(.success(()))
      }
      
      return Disposables.create()
    }
    .do(onNext: {
      print(Thread.current)
    })
      .subscribe()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

