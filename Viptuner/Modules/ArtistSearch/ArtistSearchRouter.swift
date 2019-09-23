//
//  ArtistSearchRouter.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

final class ArtistSearchRouter: ArtistSearchRouterProtocol {
    weak var viewController: UIViewController?
    
    func presentArtistLookupView(artist: Artist) {
        let artistInfoEntity = ArtistInfoEntity(artist.entity)
        let artistInfoViewModel = ArtistInfoViewModel(artist.viewModel)
        let artistLookupVC = ArtistLookupWireframe.assemble(artistInfo: (entity: artistInfoEntity, viewModel: artistInfoViewModel))
        
        viewController?.navigationController?.pushViewController(artistLookupVC, animated: true)
    }
    
    func presentAlertDialog(message: String) {
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func presentNoResultMessage() {
        let alert = UIAlertController(title: "Alerta", message: "No encontramos resultados", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
}
