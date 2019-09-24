//
//  HudProvider.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

protocol HUDProvider {
    func showSuccess(message: String?)
    func showInfo(message: String?)
    func showFailure(message: String?)
    func showLoading(message: String?)
    func hideLoading()
}
