//
//  Reusable.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 22.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UICollectionViewCell: ReusableView { }


