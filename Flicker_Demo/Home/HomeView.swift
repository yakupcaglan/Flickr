//
//  HomeView.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: LayoutableView {
    
    internal lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.allowsSelection = true
        collectionView.register(HomeCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return collectionView
        
    }()

    func setupViews() {
        backgroundColor = .white
        add(collectionView)
    }
    
    func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}
