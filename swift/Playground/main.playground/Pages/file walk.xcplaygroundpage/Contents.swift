//: [Previous](@previous)

#if os(macOS)

  // thaks : https://rosettacode.org/wiki/Walk_a_directory/Recursively

  import Foundation

  extension FileManager {

    public func walk(rootPath: String) -> [String] {
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
          paths[index] = fullPath 
          index = index.advanced(by: 1)
        }
      }
      
      return paths
    }
    
    public func __walk(rootPath: String) -> [String] {
      let fileSystem = self
      
      let standardizedRootPath = NSString(string: rootPath).standardizingPath
      
      guard let directoryEnumrator = fileSystem.enumerator(atPath: standardizedRootPath) else {
        return []
      }
      
      let e1 = fileSystem.enumerator(atPath: standardizedRootPath)!
      
      var paths: [String] = []
      
      while let path = directoryEnumrator.nextObject() as? String {
        
        var isDirectory: ObjCBool = false
        let fullPath = "\(standardizedRootPath)/\(path)"
        fileSystem.fileExists(atPath: fullPath, isDirectory: &isDirectory)
        
        if !isDirectory.boolValue {
          paths.append(fullPath)
        }
      }
      
      return paths
    }

  }

//let __paths = FileManager.default.__walk(rootPath: "~/Develop/src/github.com/eure/pairs-gl-ios/worktree/develop")

let paths = FileManager.default.walk(rootPath: "~/Develop/src/github.com/eure/pairs-gl-ios/worktree/develop")

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
