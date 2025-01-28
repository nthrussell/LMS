//
//  RecentVideoCell.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit
import Kingfisher

class RecentVideoCell: UITableViewCell {
    static let identifier = "RecentVideoCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 0.5
        view.layer.borderColor = Constant.Colors.AccentColor.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let videoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.backgroundColor = Constant.Colors.AccentColor
        label.textAlignment = .center
        label.layer.cornerRadius = 11
        label.clipsToBounds = true
        label.text = "Last Man Stands"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Constant.Colors.AccentColor
        label.text = "03/10/2024 | Highlits"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = Constant.Colors.deepGreenColor
        label.numberOfLines = 2
        label.text = "Lorem ipsum donate dolor sit amet Lorem ipsum donate dolor sit amet"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none // Disable the gray background on selection
        contentView.backgroundColor = Constant.Colors.BGColor
        contentView.addSubview(containerView)
        
        containerView.addSubview(videoImageView)
        containerView.addSubview(tagLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(shareButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container View
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Video ImageView
            videoImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            videoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            videoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            videoImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6),
            
            // Tag Label
            tagLabel.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 8),
            tagLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            tagLabel.widthAnchor.constraint(equalToConstant: 120),
            tagLabel.heightAnchor.constraint(equalToConstant: 22),
            
            // Title Label
            titleLabel.centerYAnchor.constraint(equalTo: tagLabel.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: tagLabel.trailingAnchor, constant: 5),
            
            // Description Label
            descriptionLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            // Share Button
            shareButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            shareButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            shareButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            shareButton.heightAnchor.constraint(equalToConstant: 25),
            shareButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configure(image: String, tag: String, title: String, description: String, shareText: String) {
        videoImageView.kf.setImage(with: URL(string: image))
        tagLabel.text = tag
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
