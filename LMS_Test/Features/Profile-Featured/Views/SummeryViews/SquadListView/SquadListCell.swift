//
//  SquadListCell.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit
import Kingfisher

// MARK: - Collection View Cell
class SquadListCell: UICollectionViewCell {
    static let identifier = "SquadListCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = false // Keep shadow visible
        return view
    }()
    
    private let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Harry Jonson"
        label.textAlignment = .left
        label.textColor = Constant.Colors.deepGreenColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let batsmanLabel: UILabel = {
        let label = UILabel()
        label.text = "Right hand batsman"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = Constant.Colors.AccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bowlerLabel: UILabel = {
        let label = UILabel()
        label.text = "Right arm spin"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = Constant.Colors.AccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(playerImageView)
        containerView.addSubview(playerNameLabel)
        containerView.addSubview(batsmanLabel)
        containerView.addSubview(bowlerLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container View Constraints
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Player Image View Constraints
            playerImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            playerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            playerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            playerImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.75),
            
            // Player Name Label Constraints
            playerNameLabel.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 12),
            playerNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            playerNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            //playerNameLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.1),

            // Batsman Label Constraints
            batsmanLabel.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 4),
            batsmanLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            batsmanLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // Bowler Label Constraints
            bowlerLabel.topAnchor.constraint(equalTo: batsmanLabel.bottomAnchor, constant: 2),
            bowlerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            bowlerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    func configure(image: String, name: String, batsman: String, bowler: String) {
        playerImageView.kf.setImage(with: URL(string: image))
        playerNameLabel.text = name
        batsmanLabel.text = batsman
        bowlerLabel.text = bowler
    }
}
