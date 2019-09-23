//
//  ArtistInfoViewModel.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct ArtistInfoViewModel: ArtistInfoViewModelProtocol {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init(_ artist: ArtistViewModelProtocol) {
        self.name = artist.name
    }
}
