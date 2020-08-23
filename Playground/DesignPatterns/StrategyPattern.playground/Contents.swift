import UIKit

//The strategy pattern defines a family of interchangeable objects
//that can be set ot switched at runtime

//unlike delegation, the strategy pattern uses a family of objects. delegates are often fixed at runtime.
//it's rare for these to change during runtime.

//strategies are intended to be easily interchangeable at runtime.

public protocol MovieRatingStrategy {
    var ratingServiceName: String { get }
    func fetchRating(for movieTitle: String, success:(_ rating: String, _ review: String) -> ())
}

public class RottenTomatoesClient: MovieRatingStrategy {
    public let ratingServiceName = "Roten Tomatoes"
    
    public func fetchRating(for movieTitle: String, success: (String, String) -> ()) {
        let rating = "95%"
        let review = "It rocked!"
        success(rating, review)
    }
}

public class IMDbClient: MovieRatingStrategy {
    public let ratingServiceName = "IMDb"
    
    public func fetchRating(for movieTitle: String, success: (String, String) -> ()) {
        let rating = "3/10"
        let review = "It was terrible! The audience was throwing rotten tomatoes!"
        success(rating, review)
    }
}

var movieRatingClient: MovieRatingStrategy = RottenTomatoesClient()
movieRatingClient.fetchRating(for: "A Moview"){ (rating, review) in
    print("rating: \(rating)")
    print("review: \(review)")
}
