//
//  ArtistsDataSources.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift

protocol ArtistsDataSourceProtocol: class { }

protocol ArtistCloudSourceProtocol: ArtistsDataSourceProtocol {
    func fetchArtists(name: String) -> Single<SearchResponse>
    func fetchArtistDetail(artisId: Int) -> Single<LookupResponse>
}
