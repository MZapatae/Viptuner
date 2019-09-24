//
//  SVProgressHudProvider.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import SVProgressHUD

class SVProgressHudProvider: HUDProvider {
    
    static let shared = SVProgressHudProvider()
    
    private init() { }
    
    func showSuccess(message: String?) {
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
    func showInfo(message: String?) {
        SVProgressHUD.showInfo(withStatus: message)
    }
    
    func showFailure(message: String?) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func showLoading(message: String?) {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
}
