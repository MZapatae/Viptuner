//
//  AppRouter.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

class AppRouter {
    
    func setupRootScreen(in window: UIWindow?) {
        let artistSearchVC = ArtistSearchWireframe.assemble()
        presentView(viewController: artistSearchVC, in: window)
    }
    
    fileprivate func presentView(viewController: UIViewController, in window: UIWindow?) {
        window?.makeKeyAndVisible()
        window?.rootViewController = viewController
    }
    
}

