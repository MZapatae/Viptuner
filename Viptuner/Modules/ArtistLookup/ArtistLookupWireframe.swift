//
//  ArtistLookupWireframe.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

final class ArtistLookupWireframe: ArtistLookupWireframeProtocol {
    
    static func assemble(artistInfo: ArtistInfo) -> UIViewController {
        let artistRepository = ArtistRepository(cloudSource: ArtistsCloudSource())
        
        let interactor = ArtistLookupInteractor(artistRepository: artistRepository)
        let presenter = ArtistLookupPresenter(artistInfo: artistInfo)
        let router = ArtistLookupRouter()
        //let view = ArtistLookupVC(nibName: "ArtistLookupView", bundle: nil)

        interactor.delegate = presenter
        presenter.interactor = interactor
        presenter.router = router
        //presenter.view = view
        //router.viewController = view
        //view.presenter = presenter
        
        return UIViewController() // view
    }

}
