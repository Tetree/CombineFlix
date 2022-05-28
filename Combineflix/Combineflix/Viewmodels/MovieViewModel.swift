//
//  MovieViewModel.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation
import UIKit

final class MovieViewModel {
     
    private let movie:Movie
    private let imageDownloadService: ImageDownloadable
    
    private var imageUrl:URL { URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")! }
    
    weak var imageWorkItem:DispatchWorkItem?
    
    var moviePath:String { movie.posterPath }
    
    init(movie: Movie, imageDownloadService: ImageDownloadable) {
        self.movie = movie
        self.imageDownloadService = imageDownloadService
   }
    
    func getImage(completionHandler: @escaping (UIImage?) -> Void) {
        var workItem:DispatchWorkItem?
        
        workItem = DispatchWorkItem(block: { [weak self] in
            //sleep(1)
            guard let dispatchWorkItem = workItem, !dispatchWorkItem.isCancelled else {
                workItem = nil
                return
            }

            guard let self = self else { return }
            self.imageDownloadService.downloadImageData(from: self.imageUrl) { result in
                switch result {
                case .success(let data):
                    if let workItem = workItem, !workItem.isCancelled {
                        let image = UIImage(data: data)
                        
                        DispatchQueue.main.async {
                            completionHandler(image)
                        }
                    }
                    
                case .failure( _):
                    if let workItem = workItem, !workItem.isCancelled {
                        DispatchQueue.main.async {
                            completionHandler(nil)
                        }
                    }
                }
                workItem = nil
            }
        })
        
        if let workItem = workItem {
            DispatchQueue.global().async(execute: workItem)
        }
        
        imageWorkItem = workItem
    }
    
}
