//
//  HomeViewControllerFactory.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 22.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import Foundation

enum HomeViewControllerFactory {
    
    static func create() -> HomeViewController {
        let viewModel = HomeViewModel(networkService: NetworkService())
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
