//
//  ImageDownloadable.swift
//  Combineflix
//
//  Created by Nuno Mota on 28/05/2022.
//

import Foundation

protocol ImageDownloadable {
    func downloadImageData(from url: URL, completionHandler: @escaping (Result<Data, ImageDownloadError>) -> Void)
}

enum ImageDownloadError : Error {
    case noDataReturned
    case serverError(Error)
}
