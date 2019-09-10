//
//  AppEnvironments.swift
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
        if isAppstoreBuild() {
            return .appstore
        } else if isAdHocBuild() {
            return .adHoc
        } else if isReleaseBuild() {
            return .release
        } else {
            return .debug
        }
    }
    
    enum BuildType: Int {
        case debug, adHoc, release, appstore
    }
}

extension AppEnvironment {
    
    private func isReleaseBuild() -> Bool {
        #if DEBUG || DEVELOPMENT
        return false
        #else
        return true
        #endif
    }
    
    private func isAdHocBuild() -> Bool {
        #if ADHOC
        return true
        #else
        return false
        #endif
    }
    
    private func isAppstoreBuild() -> Bool {
        #if arch(i386) || arch(x86_64)
        return false
        #else
        let containsSandbox = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
        let mobileprovisionPath = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision")
        return !containsSandbox && mobileprovisionPath == nil
        #endif
    }
    
}
