//
//  AnonymousComponent.swift
//  BinarySize
//
//  Created by muukii on 2019/08/30.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation

final class AnonymousComponent<Presentation> {
  
  private let _makePresentation: () -> Presentation
  
  init(makePresentation: @escaping () -> Presentation) {
    self._makePresentation = makePresentation
  }
  
  func make() -> Presentation {
    _makePresentation()
  }
}
