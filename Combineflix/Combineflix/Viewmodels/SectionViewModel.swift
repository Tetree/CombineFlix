//
//  SectionViewModel.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation
import Combine

final class SectionViewModel {
    
    let section: Section
    let networkService: NetworkServiceable
     private var movies = CurrentValueSubject<[Movie], Never>([])
    var moviePublisher:AnyPublisher<[Movie], Never> { movies.eraseToAnyPublisher() }
    private var page = 1
    
    var sectionName: String { return section.title }
    var numberOfMovies: Int { return movies.value.count }
    
    init(section: Section, networkService: NetworkServiceable) {
        self.section = section
        self.networkService = networkService
    }
    
    
    func fetchMovies(reset: Bool) {
        
        if reset {
            page = 1
        }else {
            page += 1
        }
        
        let urlString = Constants.baseUrlPath
            .replacingOccurrences(of: "{page}", with: "\(page)")
            .replacingOccurrences(of: "{section}", with: "\(section.path)")
        
        let url = URL(string: urlString)!
        
        networkService.getSectionDataFor(url, with: MovieResponse.self) { result in
            switch result {
            case .success(let response):
                
                guard let response = response else { return }
                
                if reset {
                    self.movies.value = response.results
                }else {
                    var newMovies = self.movies.value
                    newMovies.append(contentsOf: response.results)
                    self.movies.value = newMovies
                }
                
            case .failure(let error):
                print("Failed to fetch section  data with error: \(error)")
            }
        }
        
    }
    
    func getViewmodel(for index: Int) -> MovieViewModel {
        MovieViewModel(movie: movies.value[index])
    }
    
}
