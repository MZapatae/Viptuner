//
//  AppDelegate.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configurateInitialVC()
        return true
    }
    
    func configurateInitialVC() {
        window = UIWindow(frame: UIScreen.main.bounds)
        AppRouter().setupRootScreen(in: window)
    }
}

