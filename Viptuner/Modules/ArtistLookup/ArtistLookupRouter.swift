//
//  ArtistLookupRouter.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit
import SafariServices

final class ArtistLookupRouter: ArtistLookupRouterProtocol {
    var viewController: UIViewController?
    
    func presentWebView(url: String) {
        guard let url = URL(string: url) else { return }
        let safariVC = SFSafariViewController(url: url)
        viewController?.present(safariVC, animated: true)
    }
    
    func presentAlertDialog(message: String) {
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
