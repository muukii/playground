//: [Previous](@previous)

#if os(macOS)

  import Foundation

  extension FileManager {

    func walk(rootPath: String) -> [String] {
      let fileSystem = self

      let standardizedRootPath = NSString(string: rootPath).standardizingPath

      guard let directoryEnumrator = fileSystem.enumerator(atPath: standardizedRootPath) else {
        return []
      }

      let e1 = fileSystem.enumerator(atPath: standardizedRootPath)!
      var fileCount: Int = 0
      while e1.nextObject() != nil {
        fileCount += 1
      }

      var paths = Array<String>.init(repeating: "", count: fileCount)
      var index: Int = 0
      while let path = directoryEnumrator.nextObject() as? String {

        var isDirectory: ObjCBool = false
        let fullPath = "\(standardizedRootPath)/\(path)"
        fileSystem.fileExists(atPath: fullPath, isDirectory: &isDirectory)

        if !isDirectory.boolValue {
          paths[index] = path
          index = index.advanced(by: 1)
        }
      }
      
      return paths
    }

  }

 let paths = FileManager.default.walk(rootPath: "/Users/muukii/Develop/src/github.com/muukii/playground")

print(paths.filter { $0.hasSuffix(".swift") })

#endif


//: [Next](@next)
