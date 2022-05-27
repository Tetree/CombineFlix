//
//  MovieViewModel.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation

struct MovieViewModel {
     
    private let movie:Movie
    
    var moviePath:String { movie.posterPath }
    
    init(movie: Movie) {
       self.movie = movie
   }
    
}
