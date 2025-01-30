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
            firstTextColor: Constant.Colors.textDeepGreenColor,
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
        let button = UIButton(type: .custom)
        let image = UIImage(named: "view_more_white")
        button.setImage(image, for: .normal)
        button.backgroundColor = Constant.Colors.deepGreenColor
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 2
        button.layer.borderColor = Constant.Colors.buttonRed.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Data Source
    var recentVideos: [RecentVideo]?
    
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
    
    func updateUI(with recentVideos: [RecentVideo]) {
        self.recentVideos = recentVideos
        self.tableView.reloadData()
    }
    
    func extractTitleFromIframe(_ iframe: String) -> String {
        let pattern = "title=\\\"(.*?)\\\""
        if let regex = try? NSRegularExpression(pattern: pattern, options: []),
           let match = regex.firstMatch(in: iframe, options: [], range: NSRange(location: 0, length: iframe.utf16.count)) {
            if let range = Range(match.range(at: 1), in: iframe) {
                return String(iframe[range])
            }
        }
        return "No Description Available"
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentVideos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentVideoCell.identifier, for: indexPath) as? RecentVideoCell else {
            return UITableViewCell()
        }
        if let video = recentVideos?[indexPath.row] {
            let description = extractTitleFromIframe(video.playbackUrl)
            cell.configure(
                image: video.youtube, // Use YouTube thumbnail if available
                tag: "\(video.teamId)",
                title: video.formattedDate,
                description: description,
                shareText: ""
            )
        }
        return cell
    }
}
