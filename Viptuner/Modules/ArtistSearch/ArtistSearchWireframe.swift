//
//  ArtistSearchWireframe.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

final class ArtistSearchWireframe: ArtistSearchWireframeProtocol {
    
    static func assemble() -> UIViewController {
        let artistRepository = ArtistRepository(cloudSource: ArtistsCloudSource())

        let interactor = ArtistSearchInteractor(artistRepository: artistRepository)
        let presenter = ArtistSearchPresenter()
        let router = ArtistSearchRouter()
        //let view = ArtistLookupVC(nibName: "ArtistLookupView", bundle: nil)
        
        //let navigation = AppNavigation(rootViewController: view)
        
        interactor.delegate = presenter
        presenter.interactor = interactor
        presenter.router = router
        //presenter.view = view
        //router.viewController = view
        //view.presenter = presenter
        
        return UIViewController() // navigation
    }
    
    
}