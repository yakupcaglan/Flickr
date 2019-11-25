//
//  HomeCell.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class HomeCell: CollectionViewCell<Photo> {
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        
        if #available(*, iOS 13.0) {
            view.style = .large
        } else {
            view.style = .gray
        }
        
        return view
    }()
    
    private (set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true   
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupViews() {
        addSubview(imageView)
    }
    
    override func setupLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func updateLayout(_ item: Photo?) {
        if let item = item, let urlString = item.url, let url = URL(string: urlString) {
            self.imageView.sd_setImage(with: url)
        } else {
            self.imageView.image = UIImage(named: "no-image")
        }
    }
}
