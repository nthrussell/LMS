//
//  RecentVideosView.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit

class RecentVideosView: BindView<FeaturedViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Background View
    private let backgroundA: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Colors.BGColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Title Label
    private let titleLabel: FormattedTextLabel = {
        let label = FormattedTextLabel()
        label.setColoredText(
            firstText: "RECENT",
            firstTextColor: .black,
            secondText: "VIDEOS",
            secondTextColor: Constant.Colors.AccentColor
        )
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Constant.Colors.BGColor
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(RecentVideoCell.self, forCellReuseIdentifier: RecentVideoCell.identifier)
        return tableView
    }()
    
    // MARK: - View More Button
    private let viewMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("VIEW MORE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constant.Colors.deepGreenColor
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Data Source
    private let videos = [
        (image: UIImage(named: "video1") ?? UIImage(), tag: "New", title: "iOS Development", description: "Learn the basics of SwiftUI and UIKit.", shareText: "Share"),
        (image: UIImage(named: "video2") ?? UIImage(), tag: "Trending", title: "Combine Framework", description: "Discover how to use Combine effectively.", shareText: "Share")
    ]
    
    // MARK: - Setup View
    override func setupViews() {
        addSubview(backgroundA)
        backgroundA.addSubview(titleLabel)
        backgroundA.addSubview(tableView)
        backgroundA.addSubview(viewMoreButton)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Constraints
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            // Background A
            backgroundA.topAnchor.constraint(equalTo: topAnchor),
            backgroundA.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundA.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundA.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: backgroundA.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundA.leadingAnchor, constant: 8),
            
            // TableView
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: backgroundA.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: backgroundA.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: viewMoreButton.topAnchor, constant: -16),
            
            // View More Button
            viewMoreButton.bottomAnchor.constraint(equalTo: backgroundA.bottomAnchor, constant: -16),
            viewMoreButton.centerXAnchor.constraint(equalTo: backgroundA.centerXAnchor),
            viewMoreButton.widthAnchor.constraint(equalToConstant: 150),
            viewMoreButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentVideoCell.identifier, for: indexPath) as? RecentVideoCell else {
            return UITableViewCell()
        }
//        let video = videos[indexPath.row]
//        cell.configure(image: video.image, tag: video.tag, title: video.title, description: video.description, shareText: video.shareText)
        return cell
    }
}

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
    
    func configure(image: UIImage, tag: String, title: String, description: String, shareText: String) {
        videoImageView.image = image
        tagLabel.text = tag
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
