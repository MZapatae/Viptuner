//
//  ArtistLookupVC+UILogic.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/24/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

extension ArtistLookupVC {
    
    func setupTableView() {
        trackListTableView.dataSource = self
        trackListTableView.register(TrackViewCell.self)
        trackListTableView.tableFooterView = UIView()
    }
    
}
