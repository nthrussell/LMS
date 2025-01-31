//
//  RecentResultsCell.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit
import Kingfisher

class RecentResultsCell: UITableViewCell {
    static let identifier = "RecentResultsCell"
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Saturday 05 October"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.textColor = Constant.Colors.desTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "dateLabel"
        return label
    }()
    
    private let sideAImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "sideAImageView"
        return imageView
    }()
    
    private let sideAWinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "win_badge")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "sideAWinImageView"
        return imageView
    }()
    
    private let sideATitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "sideATitleLabel"
        return label
    }()
    
    private let sideBImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "sideBImageView"
        return imageView
    }()
    
    private let sideBTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Team B"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "sideBTitleLabel"
        return label
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = Constant.Colors.AccentColor.withAlphaComponent(0.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "vsLabel"
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = Constant.Colors.AccentColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "resultLabel"
        return label
    }()
    
    private let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = Constant.Colors.AccentColor.withAlphaComponent(0.3)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.accessibilityIdentifier = "recentSeparator"
        return separator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = Constant.Colors.AccentColor.cgColor
        contentView.addSubview(dateLabel)
        contentView.addSubview(sideAImageView)
        contentView.addSubview(sideAWinImageView)
        contentView.addSubview(sideATitleLabel)
        contentView.addSubview(sideBImageView)
        contentView.addSubview(sideBTitleLabel)
        contentView.addSubview(vsLabel)
        contentView.addSubview(resultLabel)
        contentView.addSubview(separator)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Date Label
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // VS Label
            vsLabel.centerYAnchor.constraint(equalTo: sideAImageView.centerYAnchor),
            vsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Side A
            sideAImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            sideAImageView.trailingAnchor.constraint(equalTo: vsLabel.leadingAnchor, constant: -14),
            sideAImageView.widthAnchor.constraint(equalToConstant: 44),
            sideAImageView.heightAnchor.constraint(equalToConstant: 44),
            
            sideAWinImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            sideAWinImageView.leadingAnchor.constraint(equalTo: sideAImageView.leadingAnchor, constant: -12),
            sideAWinImageView.widthAnchor.constraint(equalToConstant: 24),
            sideAWinImageView.heightAnchor.constraint(equalToConstant: 24),
            
            sideATitleLabel.topAnchor.constraint(equalTo: sideAImageView.bottomAnchor, constant: 4),
            sideATitleLabel.trailingAnchor.constraint(equalTo: sideAImageView.trailingAnchor),
            
            // Side B
            sideBImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            sideBImageView.leadingAnchor.constraint(equalTo: vsLabel.trailingAnchor, constant: 14),
            sideBImageView.widthAnchor.constraint(equalToConstant: 44),
            sideBImageView.heightAnchor.constraint(equalToConstant: 44),
            
            sideBTitleLabel.topAnchor.constraint(equalTo: sideBImageView.bottomAnchor, constant: 4),
            sideBTitleLabel.leadingAnchor.constraint(equalTo: sideBImageView.leadingAnchor),
            
            // Result Label
            resultLabel.topAnchor.constraint(equalTo: sideATitleLabel.bottomAnchor, constant: 8),
            resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //resultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            separator.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 8),
            separator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.widthAnchor.constraint(equalTo: widthAnchor),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(date: String, sideA: String, sideAImage: String, sideB: String, sideBImage: String, result: String) {
        dateLabel.text = date
        sideAImageView.kf.setImage(with: URL(string: sideAImage))
        sideATitleLabel.text = sideA
        sideBImageView.kf.setImage(with: URL(string: sideBImage))
        sideBTitleLabel.text = sideB
        resultLabel.text = result
    }
}
