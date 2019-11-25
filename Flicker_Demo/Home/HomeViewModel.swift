//
//  HomeViewModel.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

final class HomeViewModel: HomeViewModelProtocol {
    
    weak var delegate: HomeViewModelDelegate?
    
    private let networkService: NetworkService
    
    public required init(networkService: NetworkService) {
        self.networkService = networkService
    }

    private var photos: [Photo] = [] {
        didSet {
            self.delegate?.photosDidChange(from: self)
        }
    }
    
    private var currentPage: Int = 0
    
    private var nextPage: Int {
        if currentPage == 0 {
            return 1
        }
        
        return currentPage + 1
    }
    
    public var numberOfPhotos: Int {
        return self.photos.count
    }

//MARK:- isRefreshing değerine göre fotoğraflar tekrar yüklenir.
    public var isRefreshing: Bool = false {
        didSet {
            if isRefreshing {
                self.delegate?.refreshStateDidChange(from: self)
            }
        }
    }
    
//MARK:- Fetch Photos
    public func loadPhotos() {
        networkService.getRecentPhotos(nextPage) { (result) in
            switch result {
            case .success(let data):
                self.currentPage = data.page
                self.photos.append(contentsOf: data.photos)
            case .failure(let error):
                debugPrint("Could not fetch photos", error)
            }
        }
    }
    
    func item(at index: Int) -> Photo? {
        guard self.photos.indices.contains(index) else {
            return nil
        }
        
        return self.photos[index]
    }
    
}
