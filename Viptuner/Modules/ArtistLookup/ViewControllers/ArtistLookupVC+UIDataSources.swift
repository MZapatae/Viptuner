//
//  ArtistLookupVC+UIDataSources.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/24/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

extension ArtistLookupVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TrackViewCell
        cell.initCell(viewModel: tracks[indexPath.row], imageProvider: imageProvider)
        return cell
    }
    
}
