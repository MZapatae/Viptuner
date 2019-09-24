//
//  ArtistSearchVC.swift
//  Viptuner
//
//  Created by Miguel Angel Zapata Elizalde on 9/23/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

final class ArtistSearchVC: UIViewController {
    var presenter: ArtistSearchPresenterProtocol?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    private var hudProvider: HUDProvider
    
    var artists: [ArtistViewModelProtocol] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    required init(hudProvider: HUDProvider) {
        self.hudProvider = hudProvider
        super.init(nibName: "ArtistSearchView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupVC()
        setupTableView()
        setupSearchBar()
    }
    
}

extension ArtistSearchVC: ArtistSearchViewProtocol {
    
    func showLoadingIndicator() {
        hudProvider.showLoading(message: nil)
    }
    
    func hideLoadingIndicator() {
        hudProvider.hideLoading()
    }
    
    func showSearchResult(_ artists: [ArtistViewModelProtocol]) {
        self.artists = artists
        tableView.isHidden = false
    }
    
    func showNoSearchResults() {
        tableView.isHidden = true
    }
    
}
