//
//  ImageProvider.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/22/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

protocol ImageProvider: class {
    func loadImage(url: String, into imageView: UIImageView)
}
