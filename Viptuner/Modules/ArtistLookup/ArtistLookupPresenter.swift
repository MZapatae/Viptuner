//
//  ArtistLookupPresenter.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

final class ArtistLookupPresenter: ArtistLookupPresenterProtocol {
    var interactor: ArtistLookupInteractorProtocol?
    var router: ArtistLookupRouterProtocol?
    weak var view: ArtistLookupViewProtocol?
    
    private var artistInfo: ArtistInfo
    private var tracks: [Track] = [] {
        didSet {
            if tracks.isEmpty {
                view?.showNoResultsScreen()
            } else {
                view?.showTracks(tracks.compactMap { $0.viewModel })
            }
        }
    }
    
    required init(artistInfo: ArtistInfo) {
        self.artistInfo = artistInfo
    }
    
    func viewDidLoad() {
        interactor?.fetchTracks(artistId: artistInfo.entity.id)
        view?.showArtistInfo(artistInfo.viewModel)
    }
    
    func didTapPlayMusicButton(_ index: Int) {
        guard let track = tracks[safe: index], !track.entity.songPreviewUrl.isEmpty else { return }
        view?.playMusic(url: track.entity.songPreviewUrl)
    }
    
    func didTapAppleMusicButton() {
        if !artistInfo.entity.linkUrl.isEmpty {
            router?.presentWebView(url: artistInfo.entity.linkUrl)
        } else {
            // TODO: Show message
        }
    }
}

extension ArtistLookupPresenter: ArtistLookupInteractorDelegate {
    
    func tracksFetched(_ tracks: [Track]) {
        self.tracks = tracks
        view?.hideLoadingIndicator()
    }
    
    func tracksFetchFailed(_ error: Error) {
        view?.hideLoadingIndicator()
        router?.presentAlertDialog(message: error.localizedDescription)
    }

}
