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
        imageView.accessibilityIdentifier = "videoImageView"
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
        label.accessibilityIdentifier = "tagLabel"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Constant.Colors.AccentColor
        label.text = "03/10/2024 | Highlits"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "recentTitleLabel"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Constant.Colors.textDeepGreenColor
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "recentDescriptionLabel"
        return label
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "shareButton"
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
            titleLabel.leadingAnchor.constraint(equalTo: tagLabel.trailingAnchor, constant: 15),
            
            // Description Label
            descriptionLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            // Share Button
            shareButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            shareButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            shareButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            shareButton.heightAnchor.constraint(equalToConstant: 25),
            shareButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configure(image: String, tag: String, title: String, description: String, shareText: String) {
        videoImageView.kf.setImage(with: URL(string: image))
        titleLabel.text = title
        descriptionLabel.text = description
        
        if let thumbnailURL = getYouTubeThumbnailURL(from: image),
                 let url = URL(string: thumbnailURL) {
            videoImageView.kf.setImage(with: url)
           }
    }
    
    // Helper function to get YouTube thumbnail URL
    func getYouTubeThumbnailURL(from url: String) -> String? {
        let pattern = #"(?<=embed/|v=|youtu\.be/|\/v\/|\/e\/|watch\?v=|&v=|\/videos\/|embed%2F|youtu\.be%2F|\/v%2F)([A-Za-z0-9_-]{11})"#
        
        if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
            let nsString = url as NSString
            let results = regex.firstMatch(in: url, options: [], range: NSRange(location: 0, length: nsString.length))
            
            if let range = results?.range(at: 1) {
                let videoID = nsString.substring(with: range)
                return "https://img.youtube.com/vi/\(videoID)/hqdefault.jpg"
            }
        }
        
        return nil
    }
}
