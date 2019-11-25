//
//  Contracts.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 25.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol: class {
    var delegate: HomeViewModelDelegate? { get }
    
    var numberOfPhotos: Int { get }
    
    var isRefreshing: Bool { get }
    
    func loadPhotos()
    
    func item(at index: Int) -> Photo?
}

protocol HomeViewModelDelegate: class {
    func photosDidChange(from viewModel: HomeViewModel)
    
    func refreshStateDidChange(from viewModel: HomeViewModel)
}
