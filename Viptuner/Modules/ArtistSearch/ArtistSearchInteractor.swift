//
//  ArtistSearchInteractor.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift

final class ArtistSearchInteractor: ArtistSearchInteractorProtocol {
    weak var delegate: ArtistSearchInteractorDelegate?
    private let disposeBag = DisposeBag()

    private let artistRepository: ArtistRepositoryProtocol
    private var artistsFounded: [Artist] = []
    
    init(artistRepository: ArtistRepositoryProtocol) {
        self.artistRepository = artistRepository
    }
    
    func searchArtists(name: String) {
        artistRepository.fetchArtists(name: name).subscribe { [weak self] observable in
            guard let strongSelf = self else { return }
            
            switch observable {
            case .next(let artist):
                strongSelf.artistsFounded.append(artist)
            case .error(let error):
                strongSelf.delegate?.artistSearchFailed(error)
                strongSelf.artistsFounded.removeAll()
            case .completed:
                strongSelf.delegate?.searchedArtists(strongSelf.artistsFounded)
                strongSelf.artistsFounded.removeAll()
            }
        }.disposed(by: disposeBag)
    }

}
