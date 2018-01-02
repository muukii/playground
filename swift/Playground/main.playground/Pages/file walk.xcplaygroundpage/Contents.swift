//: [Previous](@previous)

#if os(macOS)

  // thaks : https://rosettacode.org/wiki/Walk_a_directory/Recursively

  import Foundation

  extension FileManager {

    public func __walk(rootPath: String) -> [String] {
      let fileSystem = self
      
      let standardizedRootPath = NSString(string: rootPath).standardizingPath
      
      guard let directoryEnumrator = fileSystem.enumerator(atPath: standardizedRootPath) else {
        return []
      }

      var paths: [[String]] = [[]]

      print(directoryEnumrator.directoryAttributes!)

      while let path = directoryEnumrator.nextObject() as? String {
        
        var isDirectory: ObjCBool = false
        let fullPath = "\(standardizedRootPath)/\(path)"
        fileSystem.fileExists(atPath: fullPath, isDirectory: &isDirectory)
        
        if !isDirectory.boolValue {
          paths[0].append(fullPath)
        }
      }
      
      return paths[0]
    }

    public func find(directoryName: String, from rootPath: String) -> [String] {
      let fileSystem = self

      let standardizedRootPath = NSString(string: rootPath).standardizingPath

      guard let directoryEnumrator = fileSystem.enumerator(
        at: URL.init(fileURLWithPath: standardizedRootPath),
        includingPropertiesForKeys: [
          .isDirectoryKey,
          .nameKey,
        ],
        options: [
          .skipsHiddenFiles,
          .skipsPackageDescendants,
        ],
        errorHandler: nil
        ) else {
        return []
      }

      // https://medium.com/folded-plane/swift-array-appending-and-avoiding-o-n-6082619cdf7b
      var paths: [[String]] = [[]]

      while let path = directoryEnumrator.nextObject() as? URL {

        let r = try! path.resourceValues(forKeys: [.isDirectoryKey, .nameKey])

        if r.isDirectory!, r.name == directoryName {
          paths[0].append(path.path)
          directoryEnumrator.skipDescendants()
        }
      }

      return paths[0]
    }
  }

//let __paths = FileManager.default.__walk(rootPath: "~/Develop/src/github.com/eure/pairs-gl-ios/worktree/develop")

let paths = FileManager.default.__walk(rootPath: "~/tower/branches")
//let paths = FileManager.default.find(directoryName: "me.muukii.tower.work", from: "~/tower/branches")

  print(paths.description)

let swiftFilePaths = paths.lazy.filter { $0.hasSuffix(".swift") }

//for swiftFilePath in swiftFilePaths {
//  do {
//    let file = try String(contentsOfFile: swiftFilePath)
//    file.enumerateLines(invoking: { (line, stop) in
//      print(line)
//    })
//  } catch {
//    print(error)
//  }
//}
//  
#endif


//: [Next](@next)
