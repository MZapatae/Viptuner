//
//  ArtistViewModel.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/21/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct ArtistViewModel: ArtistViewModelProtocol {
    var id: Int
    var name: String
    
    init?(_ artistResponse: ArtistResponse) {
        guard
            let id = artistResponse.amgArtistId,
            let name = artistResponse.artistName
        else {
            return nil
        }
        
        self.id = id
        self.name = name
    }

}
