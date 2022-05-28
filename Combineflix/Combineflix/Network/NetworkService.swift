//
//  NetworkService.swift
//  Combineflix
//
//  Created by Nuno Mota on 27/05/2022.
//

import Foundation

final class NetworkService: NetworkServiceable {
    
    static let shared = NetworkService()

    private init() {}
    
    func getSectionDataFor<T>(_ url: URL, with type: T.Type, completionHandler: @escaping (Result<T?, NetworkServiceError>) -> Void) where T : Decodable {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completionHandler(.failure(NetworkServiceError.serverError))
                return
            }
            
            if let error = error {
                completionHandler(.failure(NetworkServiceError.requestFailed(error)))
                return
            }
            
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    
                    let finalResponse = try decoder.decode(T.self, from: data)
                    completionHandler(.success(finalResponse))
                    
                }catch {
                    completionHandler(.failure(NetworkServiceError.invalidResponseType))
                }
                
            }else {
                completionHandler(.failure(NetworkServiceError.noDataAvailable))
            }
            
        }
        
        task.resume()
    }
    
    
    
    

    
}
