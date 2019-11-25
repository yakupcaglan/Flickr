//
//  DetailModel.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelDelegate? { get }
    var image: UIImage { get }
}

protocol DetailViewModelDelegate: class { }


final class DetailViewModel: DetailViewModelProtocol {
   
    weak var delegate: DetailViewModelDelegate?
    var image: UIImage

    public required init(image: UIImage) {
        self.image = image
    }
}
