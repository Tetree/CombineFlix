//
//  MainViewModel.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation

struct MainViewModel {
    
    private let sections = [Section(path: "top_rated", title: "For You"),
                           Section(path: "now_playing", title: "Now Playing"),
                           Section(path: "popular", title: "Popular"),
                           Section(path: "top_rated", title: "Top Rated"),
                           Section(path: "upcoming", title: "Upcoming"),
                           Section(path: "popular", title: "Trending")]
    
    var numberOfSections:Int { return sections.count }
    
    func viewmodelForSection(at index: Int) -> SectionViewModel {
        SectionViewModel(section: sections[index], networkService: NetworkService())
    }
    
    
}
