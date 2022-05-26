//
//  MovieResponse.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

