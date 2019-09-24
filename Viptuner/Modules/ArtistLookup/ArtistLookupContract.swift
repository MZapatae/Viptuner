//
//  ArtistLookupContract.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

protocol ArtistLookupWireframeProtocol: class {
    static func assemble(artistInfo: ArtistInfo) -> UIViewController
}

protocol ArtistLookupInteractorProtocol: class {
    var delegate: ArtistLookupInteractorDelegate? { get set }
    
    func fetchTracks(artistId: Int)
}

protocol ArtistLookupInteractorDelegate: class {
    func tracksFetched(_ tracks: [Track])
    func tracksFetchFailed(_ error: Error)
}

protocol ArtistLookupPresenterProtocol: class {
    var interactor: ArtistLookupInteractorProtocol? { get set }
    var router: ArtistLookupRouterProtocol? { get set }
    var view: ArtistLookupViewProtocol? { get set }
    
    init(artistInfo: ArtistInfo)
    
    func viewDidLoad()
    func didTapPlayMusicButton(_ index: Int)
    func didTapAppleMusicButton()
}

protocol ArtistLookupRouterProtocol: class {
    var viewController: UIViewController? { get set }

    func presentWebView(url: String)
    func presentAlertDialog(message: String)
}

protocol ArtistLookupViewProtocol: class {
    var presenter: ArtistLookupPresenterProtocol? { get set }
    
    init(hudProvider: HUDProvider, imageProvider: ImageProvider) // missing player
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showTracks(_ tracks: [TrackViewModelProtocol])
    func showArtistInfo(_ artistInfo: ArtistInfoViewModelProtocol)
    func playMusic(url: String)
    func showNoResultsScreen()
}



