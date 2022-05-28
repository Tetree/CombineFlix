//
//  ImageDownloadService.swift
//  Combineflix
//
//  Created by Nuno Mota on 28/05/2022.
//

import Foundation

final class ImageDownloadService: ImageDownloadable {
    
    static let shared = ImageDownloadService()
    
    private init() {}
    
    private lazy var session:URLSession = {
        let session = URLSession(configuration: URLSession.shared.configuration)
        URLCache.shared.diskCapacity = 50 * 1024 * 1024
        session.configuration.requestCachePolicy = .returnCacheDataElseLoad
        return session
    }()
    
    func downloadImageData(from url: URL, completionHandler: @escaping  (Result<Data, ImageDownloadError>) -> Void) {

        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completionHandler(.failure(ImageDownloadError.serverError(error)))
                return
            }
            
            if let data = data {
                completionHandler(.success(data))
            }else {
                completionHandler(.failure(ImageDownloadError.noDataReturned))
            }
            
        }
        task.resume()
    }
    
}
