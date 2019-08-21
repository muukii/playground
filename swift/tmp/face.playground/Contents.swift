import UIKit

import Vision

let image1 = #imageLiteral(resourceName: "9F12B06B-51AB-4C06-8CCD-FAD1327CC4F4.jpeg")
let image2 = #imageLiteral(resourceName: "DSCF6577.jpeg")
let image3 = #imageLiteral(resourceName: "DSCF6593.jpeg")

let request1 = VNDetectFaceLandmarksRequest.init { (request, error) in
  print(request, error)
  print(request.results?.count)
}

let request2 = VNDetectFaceRectanglesRequest.init { (request, error) in
  print(request, error)
  print(request.results?.count)
}

let handler = VNImageRequestHandler(cgImage: image1.cgImage!, options: [:])
try handler.perform([request1, request2])

