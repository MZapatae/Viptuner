//
//  ArtistSCloudSource.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift
import RxAlamofire

class ArtistsCloudSource: ArtistCloudSourceProtocol {
    private let networkProvider = RxAlamofireNetworkProvider.shared
    
    func fetchArtists(name: String) -> Single<SearchResponse> {
        return networkProvider.request(API.searchArtist(query: name)).mapResponseDataAsObject(type: SearchResponse.self).asSingle()
    }
    
    func fetchArtistTracks(artistId: Int) -> Single<LookupResponse> {
        return networkProvider.request(API.artistTracks(artistId: artistId)).mapResponseDataAsObject(type: LookupResponse.self).asSingle()
    }
    
}
