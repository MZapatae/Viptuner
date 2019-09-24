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
        guard let query = searchBar.text, !query.isEmpty else { return }
        presenter?.didSearchArtist(name: query)
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if  searchText.isEmpty {
            artists.removeAll()
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
            searchBar.resignFirstResponder()
        }
    }

}

extension ArtistSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectArtist(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
