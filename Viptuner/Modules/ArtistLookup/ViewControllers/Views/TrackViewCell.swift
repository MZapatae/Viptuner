//
//  TrackViewCell.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/24/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

class TrackViewCell: UITableViewCell {
    @IBOutlet private var songNameLabel: UILabel!
    @IBOutlet private var albumNameLabel: UILabel!
    @IBOutlet private var albumImageView: UIImageView!
    
    private var imageProvider: ImageProvider?
    
    static var height: CGFloat = 175.0
    
    private var songNameText: String = "" {
        didSet {
            songNameLabel.text = songNameText
        }
    }
    
    private var albumNameText: String = "" {
        didSet {
            albumNameLabel.text = albumNameText
        }
    }
    
    private var albumImage: String = "" {
        didSet {
            imageProvider?.loadImage(url: albumImage, into: albumImageView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.songNameText = songNameText)
        (self.albumNameText = albumNameText)
    }
    
    func initCell(viewModel: TrackViewModelProtocol, imageProvider: ImageProvider) {
        self.songNameText = viewModel.songName
        self.albumNameText = viewModel.albumName
        self.albumImage = viewModel.artworkUrl
        self.imageProvider = imageProvider
    }

}
