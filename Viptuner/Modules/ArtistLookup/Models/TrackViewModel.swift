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
    var hasMusicPreview: Bool
    
    init(albumName: String, songName: String, artworkUrl: String, hasMusicPreview: Bool) {
        self.albumName = albumName
        self.songName = songName
        self.artworkUrl = artworkUrl
        self.hasMusicPreview = hasMusicPreview
    }
    
    init(_ trackResponse: TrackResponse) {
        self.albumName = trackResponse.collectionName ?? ""
        self.songName = trackResponse.trackName ?? ""
        self.artworkUrl = trackResponse.artworkUrl100 ?? ""
        self.hasMusicPreview = trackResponse.previewUrl?.isEmpty ?? true ? false : true
    }
}
