//
//  AppColors.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

enum AppColors: String {
    case backgroundOne = "Background/background.1"
    case surfaceOne = "Surface/surface.1"
    case labelOne = "Label/label.1"
    case labelTwo = "Label/label.2"
    case navbarOne = "NavBar/navbar.1"
    case navbarTwo = "NavBar/navbar.2"
    case navbarThree = "NavBar/navbar.3"
    
    var uiColor: UIColor {
        switch self {
        default:
            return UIColor(named: self.rawValue) ?? UIColor.clear
        }
    }
}
