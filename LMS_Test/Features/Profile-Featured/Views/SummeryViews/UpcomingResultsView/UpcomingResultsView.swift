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
    
    // MARK: - Header Title View
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming RESULTS"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Footer Button View
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("VIEW ALL", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
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
        headerView.addSubview(titleLabel)

        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
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
            viewAllButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        tableView.tableFooterView = footerView
    }
    
    // MARK: - Constraints
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
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
                date: result.dateTime,
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
