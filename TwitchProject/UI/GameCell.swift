//
//  GameCell.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import UIKit
import SnapKit
import Kingfisher

class GameCell: UITableViewCell {
    private let chanelsNumberLabel = UILabel()
    private let viewersNumberLabel = UILabel()
    private let gameNameLabel = UILabel()
    
    private let coverImage = UIImageView()
    
    private let coverHeight = 190
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        
        coverImage.kf.setImage(with: URL(string: image))
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        selectionStyle = .default
        
        addSubview(gameNameLabel)
        gameNameLabel.textColor = .black
        gameNameLabel.textAlignment = .center
        gameNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addSubview(coverImage)
        coverImage.contentMode = .scaleAspectFit
        coverImage.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(190)
        }
        
        addSubview(chanelsNumberLabel)
        chanelsNumberLabel.textColor = .black
        chanelsNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        
        addSubview(viewersNumberLabel)
        viewersNumberLabel.textColor = .black
        viewersNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(chanelsNumberLabel.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        
        let separator = UIView()
        addSubview(separator)
        separator.backgroundColor = .darkGray
        separator.snp.makeConstraints { make in
            make.top.equalTo(viewersNumberLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
}
