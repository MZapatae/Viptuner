//
//  ArtistLookupInteractor.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift

final class ArtistLookupInteractor: ArtistLookupInteractorProtocol {
    weak var delegate: ArtistLookupInteractorDelegate?
    private let disposeBag = DisposeBag()
    
    private let artistRepository: ArtistRepositoryProtocol
    private var songsFounded: [Track] = []
    
    init(artistRepository: ArtistRepositoryProtocol) {
        self.artistRepository = artistRepository
    }
    
    
    func fetchTracks(artistId: Int) {
        artistRepository.fetchArtistSongs(artistId: artistId).subscribe { [weak self] observable in
            guard let strongSelf = self else { return }
            
            switch observable {
            case .next(let tracks):
                strongSelf.songsFounded.append(tracks)
            case .error(let error):
                strongSelf.delegate?.tracksFetchFailed(error)
                strongSelf.songsFounded.removeAll()
            case .completed:
                strongSelf.delegate?.tracksFetched(strongSelf.songsFounded)
                strongSelf.songsFounded.removeAll()
            }
        }.disposed(by: disposeBag)
    }
}
