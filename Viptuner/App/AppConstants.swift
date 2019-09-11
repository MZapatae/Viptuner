//
//  AppConstants.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import Foundation

struct AppConstants {
    
    private init() { }
    
    enum AppInfo {
        static var version: String { return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "" }
        static var build: String { return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "" }
    }

}
