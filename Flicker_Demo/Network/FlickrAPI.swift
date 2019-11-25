//
//  FlickrAPI.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 21.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import Moya

public enum FlickrAPI {
    case getRecentPhotos(page: Int)
}

extension FlickrAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.flickr.com/")!
    }
    
    public var path: String {
        return "services/rest"
    }
    
    public var method: Method {
        switch self {
        case .getRecentPhotos:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getRecentPhotos(let page):
            let parameters: [String: Any] = ["format":"json", "nojsoncallback": 1, "page": page, "per_page": 20, "method":"flickr.photos.getRecent", "api_key":"f9b102b0981df37cf57d6e5dbfc4724d", "extras":"url_m"]
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
