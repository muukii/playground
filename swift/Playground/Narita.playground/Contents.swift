struct Narita {
  var isMale = true
}

var n: Optional<Narita> = .some(Narita())


n?.isMale

guard let _n = n else {
  return
}

if let _n = n else {
  
}

_n.isMale