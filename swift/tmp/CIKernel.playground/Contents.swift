
import UIKit
import CoreImage

NSSetUncaughtExceptionHandler { (e) in
  print(e)
}

let kernelString = """
kernel vec4 swapRedAndGreenAmount ( __sample s, float amount ) { return mix(s.rgba, s.grba, amount); }
"""

class MyFilter : CIFilter {
  
  @objc
  dynamic var inputImage: CIImage?
  
  private let kernel: CIColorKernel
  
  override init() {
    self.kernel = CIColorKernel(source: kernelString)!
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var outputImage: CIImage? {
    guard let inputImage = inputImage else { return nil }
    return kernel.apply(extent: inputImage.extent, arguments: [inputImage])
  }
}

let filter = MyFilter()

let image = #imageLiteral(resourceName: "sample.jpg")
let ciImage = CIImage(image: image)

filter.inputImage = ciImage
let result = filter.outputImage


