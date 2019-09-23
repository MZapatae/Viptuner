//
//  TrackEntity.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct TrackEntity: TrackEntityProtocol {
    var songPreviewUrl: String
    
    init(songPreviewUrl: String) {
        self.songPreviewUrl = songPreviewUrl
    }
    
    init(_ trackResponse: TrackResponse) {
        self.songPreviewUrl = trackResponse.previewUrl ?? ""
    }
}
