//
//  CollectiontinViewCell.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

class CollectionViewCell<T>: UICollectionViewCell {
  
    var item: T? {
        didSet {
            updateLayout(item)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() { }
    
    func setupLayout() { }
    
    func updateLayout(_ item: T?) { }
}

