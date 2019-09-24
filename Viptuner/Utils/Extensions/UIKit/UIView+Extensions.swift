//
//  UIViewExtensions.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }
extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing: self)
    }
}

protocol ReusableView: class { }
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
