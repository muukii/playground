//: Playground - noun: a place where people can play

import Cocoa

let p = Process()
Pipe()

private extension Process {
  @discardableResult func launchBash(with command: String, outputHandle: FileHandle? = nil, errorHandle: FileHandle? = nil) throws -> String {
    launchPath = "/bin/bash"
    arguments = ["-c", command]
    
    var outputData = Data()
    var errorData = Data()
    
    let stdoutHandler: (FileHandle) -> Void = { handler in
      let data = handler.availableData
      outputData.append(data)
      outputHandle?.write(data)
    }
    
    let stderrHandler: (FileHandle) -> Void = { handler in
      let data = handler.availableData
      errorData.append(data)
      errorHandle?.write(data)
    }
    
    let outputPipe = Pipe()
    standardOutput = outputPipe
    outputPipe.fileHandleForReading.readabilityHandler = stdoutHandler
    
    let errorPipe = Pipe()
    standardError = errorPipe
    errorPipe.fileHandleForReading.readabilityHandler = stderrHandler
    
    launch()
    waitUntilExit()
    
    outputHandle?.closeFile()
    errorHandle?.closeFile()
    
    outputPipe.fileHandleForReading.readabilityHandler = nil
    errorPipe.fileHandleForReading.readabilityHandler = nil
    
    if terminationStatus != 0 {
      throw ShellOutError(
        terminationStatus: terminationStatus,
        errorData: errorData,
        outputData: outputData
      )
    }
    
    return outputData.shellOutput()
  }
}
