//
//  KingFisherImageProvider.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import Kingfisher

class KingFisherImageProvider: ImageProvider {
    
    static let shared = KingFisherImageProvider()
    
    private init() {
        KingfisherManager.shared.cache.clearMemoryCache()
    }
    
    func loadImage(url: String, into imageView: UIImageView) {
        imageView.kf.setImage(with: URL(string: url))
    }

}
