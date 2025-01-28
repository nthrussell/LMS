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
