//
//  FeaturedView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class FeaturedView: BindView<FeaturedViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Constant.Colors.BGColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private(set) lazy var headerView: UIView = {
        let view = HeaderView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var summaryButton: UIButton = createTabButton(title: "Summary", tag: 0)
    private(set) lazy var battingButton: UIButton = createTabButton(title: "Batting", tag: 1)
    private(set) lazy var bowlingButton: UIButton = createTabButton(title: "Bowling", tag: 2)
    
    private(set) lazy var summaryView: UIView = {
        let view = SummeryView(with: viewModel)
        view.backgroundColor = Constant.Colors.BGColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var battingView: UIView = {
        let view = BattingView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var bowlingView: UIView = {
        let view = BowlingView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var selectedTabIndex: Int = 0 // Default tab index (Summary tab)
    
    override func setupViews() {
        addSubview(tableView)
        updateTabButtonStates() // Set the default button state
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createTabButton(title: String, tag: Int) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constant.Colors.AccentColor // Default color for unselected state
        button.layer.cornerRadius = 5
        button.tag = tag
        button.addTarget(self, action: #selector(didTapTab), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc private func didTapTab(sender: UIButton) {
        selectedTabIndex = sender.tag
        updateTabButtonStates()
        tableView.reloadSections(IndexSet(integer: 2), with: .automatic)
    }
    
    private func updateTabButtonStates() {
        [summaryButton, battingButton, bowlingButton].forEach { button in
            button.backgroundColor = (button.tag == selectedTabIndex) ? Constant.Colors.deepGreenColor : Constant.Colors.AccentColor
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // Header, buttons, and dynamic content
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Each section has a single row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Clear previous content
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        switch indexPath.section {
        case 0: // Header view
            cell.contentView.addSubview(headerView)
            NSLayoutConstraint.activate([
                headerView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                headerView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                headerView.heightAnchor.constraint(equalToConstant: 135)
            ])
        case 1: // Buttons
            let buttonStackView = UIStackView(arrangedSubviews: [summaryButton, battingButton, bowlingButton])
            buttonStackView.axis = .horizontal
            buttonStackView.distribution = .fillEqually
            buttonStackView.spacing = 5
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            
            cell.contentView.addSubview(buttonStackView)
            NSLayoutConstraint.activate([
                buttonStackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
                buttonStackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
                buttonStackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
                buttonStackView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -8),
                buttonStackView.heightAnchor.constraint(equalToConstant: 40)
            ])
        case 2: // Dynamic content
            let dynamicView: UIView
            switch selectedTabIndex {
            case 0: dynamicView = summaryView
            case 1: dynamicView = battingView
            case 2: dynamicView = bowlingView
            default: fatalError("Invalid tab index")
            }
            
            cell.contentView.addSubview(dynamicView)
            NSLayoutConstraint.activate([
                dynamicView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                dynamicView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                dynamicView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                dynamicView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                dynamicView.heightAnchor.constraint(equalToConstant: 4500) // Set height as per your requirement
            ])
        default:
            break
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 135 // Header height
        case 1: return 56  // Button row height
        case 2: return UITableView.automaticDimension // Dynamic content
        default: return 0
        }
    }
}
