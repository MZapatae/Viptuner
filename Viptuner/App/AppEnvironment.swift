//
//  AppEnvironment.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

class AppEnvironment {
    
    static let shared: AppEnvironment = {
        return AppEnvironment()
    }()
    
    private init() { }
    
    var buildType: BuildType {
        if isReleaseBuild() {
            return .release
        } else {
            return .development
        }
    }
    
    enum BuildType: Int {
        case development, release
    }
}

extension AppEnvironment {
    
    private func isReleaseBuild() -> Bool {
        #if DEBUG
        return false
        #else
        return true
        #endif
    }
    
    
    
}
