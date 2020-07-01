import UIKit

let baseURL = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!, isDirectory: true)

func makeRalativePath(absoluteURL: URL) -> String {
   
  let relative = absoluteURL.absoluteString.replacingOccurrences(of:  baseURL.absoluteString, with: "")
  
  return relative
}

func restoreAbsolutePath(relativePath: String) -> URL {
  baseURL.appendingPathComponent(relativePath)
}

print(baseURL)

let target = baseURL.appendingPathComponent("hogehoge")

print(restoreAbsolutePath(relativePath: makeRalativePath(absoluteURL: target)))

