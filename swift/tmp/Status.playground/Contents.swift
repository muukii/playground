public enum RatingStatus : Int {
  
  struct InReview {
    let image: Void
  }
  
  struct Rating {
    let image: Void
    let rank: Void
    let progress: Void
    let ratingValue: Double
  }
  
  struct Finished {
    let image: Void
    let rank: Void
    let ratingValue: Double
  }
  
  case never
  case inReview(InReview)
  case rating(Rating)
  case finished(Finished)
}

