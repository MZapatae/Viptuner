//
//  ArtistViewCell.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

final class ArtistViewCell: UITableViewCell {
    @IBOutlet private var contentViewCell: UIView!
    @IBOutlet private var artistNameLabel: UILabel!
    
    static var height: CGFloat = 55.0
    
    private var artistNameText: String = "" {
        didSet {
            artistNameLabel.text = artistNameText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        defer {
            (self.artistNameText = artistNameText)
        }
        setupColors()
    }
    
    func initCell(viewModel: ArtistViewModelProtocol) {
        self.artistNameText = viewModel.name
    }

}

extension ArtistViewCell {
    
    func setupColors() {
        contentViewCell.backgroundColor = AppColors.surfaceOne.uiColor
        artistNameLabel.textColor = AppColors.labelOne.uiColor
    }
    
}
