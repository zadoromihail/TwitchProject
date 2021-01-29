//
//  DetailViewController.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import UIKit
import SnapKit
import Kingfisher

class DetailViewController: UIViewController {
    
    private let chanelsNumberLabel = UILabel()
    private let viewersNumberLabel = UILabel()
    private let gameNameLabel = UILabel()
    
    private let imageView = UIImageView()
    
    private let coverHeight = 190
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func configure(gameInfo: GameInfo) {
        guard
            let name = gameInfo.nameOfTheGame,
            let channels = gameInfo.numberOfChannels,
            let viewers = gameInfo.numberOfViewers,
            let image = gameInfo.gameCover
        
        else {
            return
        }
        
        gameNameLabel.text = name
        chanelsNumberLabel.text = "Number of channels: \(channels)"
        viewersNumberLabel.text = "Number of viewers: \(viewers)"
        
        imageView.kf.setImage(with: URL(string: image))
    }
        
    private func setupUI() {
        title = "Game details"
        
        view.backgroundColor = .white
        
        view.addSubview(gameNameLabel)
        gameNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(coverHeight)
        }
        
        view.addSubview(chanelsNumberLabel)
        chanelsNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        
        view.addSubview(viewersNumberLabel)
        viewersNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(chanelsNumberLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
    }
}
