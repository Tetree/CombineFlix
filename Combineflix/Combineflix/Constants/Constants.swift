//
//  Constants.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import Foundation

enum Constants {
    private static let apiKey = "ce3ec8bb774141ccc95fd39e57190782"
    static let baseUrlPath = "https://api.themoviedb.org/3/movie/{section}?api_key=\(apiKey)&page={page}"
    static let baseImageUrlPath = "https://image.tmdb.org/t/p/w500{posterPath}"
}
