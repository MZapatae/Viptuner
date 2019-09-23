//
//  ArtistSearchContract.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

protocol ArtistSearchWireframeProtocol: class {
    static func assemble() -> UIViewController
}

protocol ArtistSearchInteractorProtocol: class {
    var delegate: ArtistSearchInteractorDelegate? { get set }
    
    func searchArtists(name: String)
}

protocol ArtistSearchInteractorDelegate: class {
    func artistsSearched(_ artists: [Artist])
    func artistSearchFailed(_ error: Error)
}

protocol ArtistSearchPresenterProtocol: class {
    var interactor: ArtistSearchInteractorProtocol? { get set }
    var router: ArtistSearchRouterProtocol? { get set }
    var view: ArtistSearchViewProtocol? { get set }
    
    func didSearchArtist(name: String)
    func didTapArtist(id: Int)
}

protocol ArtistSearchRouterProtocol: class {
    var viewController: UIViewController? { get set }

    func presentArtistLookupView(artistId: Int)
    func presentAlertDialog(message: String)
    func presentNoResultMessage()
}

protocol ArtistSearchViewProtocol: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showSearchResult(_ artist: [ArtistViewModelProtocol])
    func showNoSearchResults()
}

enum ArtistSearchErrorType: Error {
    case searchQueryInvalid
}
