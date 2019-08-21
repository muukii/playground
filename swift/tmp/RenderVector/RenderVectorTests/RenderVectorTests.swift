//
//  RenderVectorTests.swift
//  RenderVectorTests
//
//  Created by muukii on 2019/08/05.
//  Copyright © 2019 eure. All rights reserved.
//

import XCTest

@testable import RenderVector

class RenderVectorTests: XCTestCase {
  
  let image = UIImage(named: "like")!
  let data = PDFImage(named: "like")!
  
  func testStandard() {
    // This is an example of a performance test case.
    self.measure {
      for _ in 0..<100 {
        image.tinted(color: .black, size: .init(width: 30, height: 30))
        image.tinted(color: .black, size: .init(width: 60, height: 60))
        image.tinted(color: .black, size: .init(width: 90, height: 90))
      }
    }
  }
  
  func testBackported() {
    // This is an example of a performance test case.
    self.measure {
      for _ in 0..<100 {
        data.tinted(color: .black, size: .init(width: 30, height: 30))
        data.tinted(color: .black, size: .init(width: 60, height: 60))
        data.tinted(color: .black, size: .init(width: 90, height: 90))
      }
    }
  }
  
}
