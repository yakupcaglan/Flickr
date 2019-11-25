//
//  DetailView.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

class DetailView: LayoutableView {
   
    let imagaView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        
        return imageView
    }()
    
    func setupViews() {
        
        backgroundColor = .white
        add(imagaView)
    }
    
    func setupLayout() {
        imagaView.snp.makeConstraints {
            
            $0.top.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
