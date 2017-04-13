import Foundation

prefix operator >>>

public prefix func >>> <T>(_ o: T) {
  print(o)
}
