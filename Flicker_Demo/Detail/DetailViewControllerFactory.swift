//
//  DetailViewControllerFactory.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 23.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

enum DetailViewControllerFactory {
 
    static func create(with image: UIImage) -> DetailViewController {
        let viewModel = DetailViewModel(image: image)
        let viewController = DetailViewController(viewModel: viewModel)
        return viewController
    }
}
