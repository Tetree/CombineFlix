//
//  Movie.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import Foundation

// MARK: - Movie
struct Movie: Decodable, Equatable {
    let posterPath: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.posterPath == rhs.posterPath
    }
    
}
