//
//  API.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

enum API {
    
    private static let itunesBaseUrl = "https://itunes.apple.com"

    static func searchArtist(query: String) -> Endpoint<SearchResponse> {
        return Endpoint<SearchResponse>(method: .get, path: itunesBaseUrl + "/search?term=\(query)&entity=musicArtist&attribute=artistTerm&media=music")
    }
    
    static func artistSongs(artistId: Int) -> Endpoint<LookupResponse> {
        return Endpoint<LookupResponse>(method: .get, path: itunesBaseUrl + "/lookup?amgArtistId=\(artistId)&entity=song&limit=5&sort=recent")
    }
    
}
