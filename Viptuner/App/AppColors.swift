//
//  AppColors.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

enum AppColors: String {
    case backgroundOne = "background.1"
    case surfaceOne = "surface.1"
    case labelOne = "label.1"
    case labelTwo = "label.2"
    case navbarOne = "navbar.1"
    case navbarTwo = "navbar.2"
    case navbarThree = "navbar.3"
    
    var uiColor: UIColor {
        switch self {
        default:
            return UIColor(named: self.rawValue) ?? UIColor.clear
        }
    }
}
