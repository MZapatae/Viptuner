//
//  ArtistEntity.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct ArtistEntity: ArtistEntityProtocol {
    var id: Int
    var linkUrl: String
    
    init?(_ artistResponse: ArtistResponse) {
        guard
            let id = artistResponse.amgArtistId,
            let linkUrl = artistResponse.artistLinkUrl
        else {
            return nil
        }
        
        self.id = id
        self.linkUrl = linkUrl
    }

}
