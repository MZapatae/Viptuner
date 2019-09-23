//
//  Track.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

protocol TrackEntityProtocol {
    var songPreviewUrl: String { get }
}

protocol TrackViewModelProtocol {
    var albumName: String { get }
    var songName: String { get }
    var artworkUrl: String { get }
}

typealias Track = (entity: TrackEntityProtocol, viewModel: TrackViewModelProtocol)
