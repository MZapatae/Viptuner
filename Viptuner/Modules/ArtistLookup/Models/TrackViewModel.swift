//
//  TrackViewModel.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct TrackViewModel: TrackViewModelProtocol {
    var albumName: String
    var songName: String
    var artworkUrl: String
    
    init(_ trackResponse: TrackResponse) {
        self.albumName = trackResponse.collectionName ?? ""
        self.songName = trackResponse.trackName ?? ""
        self.artworkUrl = trackResponse.artworkUrl100 ?? ""
    }
}
