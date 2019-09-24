//
//  ArtistSearchVC+UILogic.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

extension ArtistSearchVC {
    
    func setupVC() {
        contentView.backgroundColor = AppColors.backgroundOne.uiColor
    }
    
    func setupNavBar() {
        navigationItem.title = "Buscar"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArtistViewCell.self)
        tableView.backgroundColor = AppColors.backgroundOne.uiColor
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
}