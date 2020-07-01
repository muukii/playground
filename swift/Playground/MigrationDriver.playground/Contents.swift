import Foundation

typealias Version = Int

final class VersionStore {
  
  private let userDefaults = UserDefaults(suiteName: "me.muukii.MigrationDriver")
  public let usingKey: String
  
  public init(usingKey: String) {
    self.usingKey = usingKey
  }
  
  func saveVersion(_ version: Version) {
    userDefaults?.set(version, forKey: usingKey)
  }
  
  func loadVersion() -> Version? {
    userDefaults?.integer(forKey: usingKey)
  }
}

struct Task<Dependency> {
  
  typealias Operation = (Dependency, (Result<Void, Error>) -> Void) -> Void
  
  let targetVersion: Version
  let operation: Operation
  
  init(
    targetVersion: Version,
    operation: @escaping Operation
  ) {
    
    self.targetVersion = targetVersion
    self.operation = operation
  }
}

final class MigrationDriver<Dependency> {
  
  private let versionStore: VersionStore
  private let tasks: [Task<Dependency>]
  
  init(
    versionStore: VersionStore,
    tasks: [Task<Dependency>]
  ) {
    
    self.versionStore = versionStore
    self.tasks = tasks
    
  }
  
  func run(completion: (Result<Void, Error>) -> Void) {
    
    guard let version = versionStore.loadVersion() else {
      completion(.success(()))
      return
    }
    
    tasks
      .sorted { $0.targetVersion < $1.targetVersion }
      .filter { $0.targetVersion > version }
    
    
  }
  
}


let a = [0,3,2,6,1].sorted(by: <)
