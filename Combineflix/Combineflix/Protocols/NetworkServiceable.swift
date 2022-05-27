//
//  NetworkServiceable.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation

protocol NetworkServiceable {
    
    func getSectionDataFor<T: Decodable>(_ url: URL, with type: T.Type, completionHandler: @escaping (Result<T?, NetworkServiceError>) -> Void)
    
}

enum NetworkServiceError: Error {
    case invalidResponseType
    case requestFailed(Error)
    case noDataAvailable
    case serverError
}
