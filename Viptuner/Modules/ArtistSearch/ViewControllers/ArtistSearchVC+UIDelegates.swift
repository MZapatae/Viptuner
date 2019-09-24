//
//  ArtistSearchVC+UISearchBarDelegate.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

extension ArtistSearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didSearchArtist(name: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
}

extension ArtistSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectArtist(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
