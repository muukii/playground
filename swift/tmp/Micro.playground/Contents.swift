import Cocoa

let value = "2016-06-10T21:42:24Z"

let iso8601FullDateFormatter: ISO8601DateFormatter = {
  let f = ISO8601DateFormatter()
  f.timeZone = TimeZone(identifier: "UTC")
  f.formatOptions = [.withInternetDateTime]
  return f
}()

iso8601FullDateFormatter.date(from: value)
