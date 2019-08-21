
enum User {
  
  enum AgeVerificationStatus {
    case notYet
    case inReview
    case verified
  }
  
  struct Male {
    var isPaid: Bool
    var ageVerificationStatus: AgeVerificationStatus
  }
  
  struct Female {
    var ageVerificationStatus: AgeVerificationStatus
  }
  
  case male(Male)
  case female(Female)
  
}


let user = User.male(.init(isPaid: true, ageVerificationStatus: .inReview))

switch user {
case .male(let male):
  
  if male.isPaid {
    switch male.ageVerificationStatus {
    case .notYet: break
    case .inReview: break
    case.verified: break
    }
  } else {
    switch male.ageVerificationStatus {
    case .notYet: break
    case .inReview: break
    case.verified: break
    }
  }
  
case .female(let female):
  
  switch female.ageVerificationStatus {
  case .notYet: break
  case .inReview: break
  case.verified: break
  }
      
}
