//
//  AppNavigation.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

class AppNavigation: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.tintColor = AppColors.navbarThree.uiColor // back and button colors
        navigationBar.barTintColor = AppColors.navbarOne.uiColor // Background Color
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColors.navbarTwo.uiColor] // Navigarion Title Color
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
