import os

let log = OSLog(subsystem: "pairs_xxx", category: .pointsOfInterest)

os_signpost(.begin, log: log, name: "")

@inline(__always)
func measure<Result>(_ name: StaticString, _ task: () -> Result) -> Result {
  let id = OSSignpostID(log: log)
  os_signpost(.begin, log: log, name: name, signpostID: id)
  let r = task()
  os_signpost(.end, log: log, name: name, signpostID: id)
  return r
}
