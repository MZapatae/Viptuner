//
//  ArtistInfoEntity.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct ArtistInfoEntity: ArtistInfoEntityProtocol {
    var id: Int
    var linkUrl: String
    
    init(id: Int, linkUrl: String) {
        self.id = id
        self.linkUrl = linkUrl
    }
    
    init(_ artist: ArtistEntityProtocol) {
        self.id = artist.id
        self.linkUrl = artist.linkUrl
    }
}
