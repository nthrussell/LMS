//
//  UpcomingResultsView.swift
//  LMS_Test
//
//  Created by russel on 29/1/25.
//

import UIKit

class UpcomingResultsView: BindView<FeaturedViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.layer.borderWidth = 0.5
        tableView.layer.borderColor = Constant.Colors.AccentColor.withAlphaComponent(0.5).cgColor
        tableView.layer.cornerRadius = 8
        tableView.register(UpcomingResultsCell.self, forCellReuseIdentifier: UpcomingResultsCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "green-mandala-NEW-CODE-UPCOMING")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Header Title View
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UPCOMING FIXTURES"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Footer Button View
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "view_all_right")
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var UpcomingResults: [UpcomingFixture]?
    
    override func setupViews() {
        addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        setupTableHeader()
        setupTableFooter()
    }
    
    private func setupTableHeader() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 50))
        headerView.backgroundColor = Constant.Colors.AccentColor
        
        headerView.addSubview(backgroundImageView)
        headerView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: headerView.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: headerView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        tableView.tableHeaderView = headerView
    }
    
    private func setupTableFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 60))
        footerView.addSubview(viewAllButton)
        
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            viewAllButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            viewAllButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 8),
            viewAllButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -8),
            viewAllButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        tableView.tableFooterView = footerView
    }
    
    // MARK: - Constraints
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func updateUI(with UpcomingResults: [UpcomingFixture]) {
        self.UpcomingResults = UpcomingResults
        tableView.reloadData()
    }
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UpcomingResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingResultsCell.identifier, for: indexPath) as? UpcomingResultsCell else {
            return UITableViewCell()
        }
        
        if let result = UpcomingResults?[indexPath.row] {
            cell.configure(
                date: result.formattedDate,
                sideA: result.teamName,
                sideAImage: result.teamLogo,
                sideB: result.oppTeamName,
                sideBImage: result.oppLogo ?? "",
                result: "View match info"
            )
        }
        return cell
    }
}
