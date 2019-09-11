//
//  API.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

enum API {
    
    static func searchArtist(query: String) -> Endpoint<SearchResponse> {
        return Endpoint<SearchResponse>(method: .get, path: "/search?term=\(query)&entity=musicArtist&attribute=artistTerm&media=music")
    }
    
    static func lookupArtist(id: Int) -> Endpoint<LookupResponse> {
        return Endpoint<LookupResponse>(method: .get, path: "/lookup?amgArtistId=\(id)&entity=song&limit=5&sort=recent")
    }
    
}
