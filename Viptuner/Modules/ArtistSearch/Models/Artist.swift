//
//  Artist.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

protocol ArtistEntityProtocol {
    var id: Int { get }
    var linkUrl: String { get }
}

protocol ArtistViewModelProtocol {
    var id: Int { get }
    var name: String { get }
}

typealias Artist = (entity: ArtistEntityProtocol, viewModel: ArtistViewModelProtocol)
