//
//  RecentPhotosResponse.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 21.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import Foundation

struct RecentPhotosResponse: Decodable {
    let data: RecentPhotosData
    
    private enum CodingKeys: String, CodingKey {
        case data = "photos"
    }
}

struct RecentPhotosData: Decodable {
    let page: Int
    let pages: Int
    let perPage: Int
    let total: Int
    let photos: [Photo]
    
    private enum CodingKeys: String, CodingKey {
        case page, pages, total
        case perPage = "perpage"
        case photos = "photo"
    }
}
