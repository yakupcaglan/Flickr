//
//  Service.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit
import Moya

public enum APIError: Error {
    case invalidURL
    case decodingError(Error)
    case networkError(MoyaError)
}


protocol NetworkServiceProtocol: class {
    func getRecentPhotos(_ page: Int, completion: @escaping (Result<RecentPhotosData, APIError>)-> Void)
}

public class NetworkService: NetworkServiceProtocol{
    
    private var provider = MoyaProvider<FlickrAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getRecentPhotos(_ page: Int, completion: @escaping (Result<RecentPhotosData, APIError>) -> Void) {
        provider.request(.getRecentPhotos(page: page)) { (result) in
            switch result{
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(RecentPhotosResponse.self, from: response.data)
                    completion(.success(response.data))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
}
