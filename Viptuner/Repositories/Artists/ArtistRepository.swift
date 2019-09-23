//
//  ArtistRepository.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift

protocol ArtistRepositoryProtocol {
    func fetchArtists(name: String) -> Observable<Artist>
    func fetchArtistSongs(artistId: Int) -> Observable<Track>
}

class ArtistRepository: ArtistRepositoryProtocol {
    private let cloudSource: ArtistCloudSourceProtocol
    
    init(cloudSource: ArtistCloudSourceProtocol) {
        self.cloudSource = cloudSource
    }
    
    func fetchArtists(name: String) -> Observable<Artist> {
        let artistResponseObservable = cloudSource.fetchArtists(name: name).asObservable().flatMapFirst { Observable.from($0.results ?? []) }
        return artistResponseObservable.flatMap { artistResponse -> Observable<Artist> in
            if let entity = ArtistEntity(artistResponse), let viewModel = ArtistViewModel(artistResponse) {
                return Observable.just((entity: entity, viewModel: viewModel))
            }
            return Observable.empty()
        }
    }
    
    func fetchArtistSongs(artistId: Int) -> Observable<Track> {
        let tracksResponseObservable = cloudSource.fetchArtistTracks(artistId: artistId).asObservable().flatMapFirst { Observable.from($0.results ?? []) }
        return tracksResponseObservable.map { trackResponse -> Track in
            let entity = TrackEntity(trackResponse)
            let viewModel = TrackViewModel(trackResponse)
            return (entity: entity, viewModel: viewModel)
        }
    }
}
