//
//  ArtistLookupVC.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/24/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import UIKit

final class ArtistLookupVC: UIViewController {
    var presenter: ArtistLookupPresenterProtocol?
    
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var appleMusicButton: UIButton!
    @IBOutlet var trackListTableView: UITableView!
    
    private var hudProvider: HUDProvider
    var imageProvider: ImageProvider
    
    var tracks: [TrackViewModelProtocol] = [] {
        didSet {
            trackListTableView.reloadData()
        }
    }
    
    private var artistNameText: String {
        didSet {
            artistNameLabel.text = artistNameText
        }
    }
    
    required init(hudProvider: HUDProvider, imageProvider: ImageProvider) {
        self.hudProvider = hudProvider
        self.imageProvider = imageProvider
        self.artistNameText = ""
        super.init(nibName: "ArtistLookupView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupInitialValues()
        presenter?.viewDidLoad()
    }
    
    func setupInitialValues() {
        (self.artistNameText = artistNameText)
    }
    
    @IBAction func didTapAppleMusicButton(_ sender: Any) {
        presenter?.didTapAppleMusicButton()
    }
    
}

extension ArtistLookupVC: ArtistLookupViewProtocol {
    
    func showLoadingIndicator() {
        hudProvider.showLoading(message: nil)
    }
    
    func hideLoadingIndicator() {
        hudProvider.hideLoading()
    }
    
    func showTracks(_ tracks: [TrackViewModelProtocol]) {
        self.tracks = tracks
        trackListTableView.isHidden = false
    }
    
    func showArtistInfo(_ artistInfo: ArtistInfoViewModelProtocol) {
        artistNameText = artistInfo.name
    }
    
    func playMusic(url: String) {
        // todo
    }
    
    func showNoResultsScreen() {
        self.trackListTableView.isHidden = true
    }
    
    
}
