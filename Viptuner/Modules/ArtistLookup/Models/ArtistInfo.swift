//
//  ArtistInfo.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

protocol ArtistInfoEntityProtocol {
    var id: Int { get }
}

protocol ArtistInfoViewModelProtocol {
    var name: String { get }
}

typealias ArtistInfo = (entity: ArtistInfoEntityProtocol, viewModel: ArtistViewModelProtocol)
