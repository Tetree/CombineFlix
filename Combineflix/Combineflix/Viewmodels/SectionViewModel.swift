//
//  SectionViewModel.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation
import Combine

struct SectionViewModel {
    
    let section: Section
    private let movies = CurrentValueSubject<[Movie], Never>([])
    
    var numberOfMovies: Int { return movies.value.count }
    
    
    func load() {
        
    }
    
}
