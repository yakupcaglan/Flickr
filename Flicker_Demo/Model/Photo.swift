//
//  ImageModel.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 21.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url_m"
    }
}
