//
//  ArtistSearchPresenter.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

final class ArtistSearchPresenter: ArtistSearchPresenterProtocol {
    var interactor: ArtistSearchInteractorProtocol?
    var router: ArtistSearchRouterProtocol?
    weak var view: ArtistSearchViewProtocol?
    
    private var artistsFounded: [Artist] = [] {
        didSet {
            if artistsFounded.isEmpty {
                view?.showNoSearchResults()
            } else {
                view?.showSearchResult(artistsFounded.compactMap { $0.viewModel })
            }
        }
    }
    
    func didSearchArtist(name: String) {
        interactor?.searchArtists(name: name)
    }
    
    func didTapArtist(id: Int) {
        router?.presentArtistLookupView(artistId: id)
    }
    
}

extension ArtistSearchPresenter: ArtistSearchInteractorDelegate {
    
    func artistsSearched(_ artists: [Artist]) {
        self.artistsFounded = artists
        view?.hideLoadingIndicator()
    }
    
    func artistSearchFailed(_ error: Error) {
        self.artistsFounded.removeAll()
        view?.hideLoadingIndicator()
        router?.presentAlertDialog(message: error.localizedDescription)
    }

}
