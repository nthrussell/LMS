//
//  BattingView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class BattingView: BindView<FeaturedViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UI Elements
    private let showFormerPlayersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SHOW FORMER PLAYERS", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Data
    private let rows: [[String]] = [
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"],
        ["Mohamed Cheikh", "81", "13444", "111.12", "162.25", "103", "07", "09", "22"]
    ]
    
    // MARK: - Setup UI
    override func setupViews() {
        addSubview(showFormerPlayersButton)
        addSubview(tableView)
        tableView.register(BattingTableViewCell.self, forCellReuseIdentifier: "BattingCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            showFormerPlayersButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            showFormerPlayersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: showFormerPlayersButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - UITableView DataSource & Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BattingCell", for: indexPath) as? BattingTableViewCell else {
            return UITableViewCell()
        }
        let rowData = rows[indexPath.row]
        cell.configure(with: rowData, isOdd: indexPath.row % 2 == 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = BattingTableHeaderView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class BattingTableHeaderView: UIView {
    private let labels: [UILabel] = [
        UILabel(), UILabel(), UILabel(), UILabel(), UILabel(),
        UILabel(), UILabel(), UILabel(), UILabel()
    ]
    private let titles = ["Name", "Inngs", "Runs", "Avg", "SR", "HS", "50s", "Nat's Rnk", "Wrld Rnk"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constant.Colors.deepGreenColor
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHeader()
    }
    
    private func setupHeader() {
        for (index, title) in titles.enumerated() {
            let label = labels[index]
            label.text = title
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.textColor = index % 2 == 0 ? .white : Constant.Colors.SegmentColor
            addSubview(label)
        }
        layoutHeaderLabels()
    }
    
    private func layoutHeaderLabels() {
        let totalWidth = UIScreen.main.bounds.width
        let nameWidth = totalWidth * 0.18 // 21% for "Name"
        let regularWidth = totalWidth * 0.09 // 7% for regular labels
        let expandedWidth = totalWidth * 0.14 // 15% for "Nat's Rnk" and "Wrld Rnk"
        
        var xOffset: CGFloat = 0
        
        for (index, label) in labels.enumerated() {
            let width: CGFloat
            if index == 0 {
                width = nameWidth
            } else if index == 7 || index == 8 {
                width = expandedWidth
            } else {
                width = regularWidth
            }
            
            label.frame = CGRect(x: xOffset, y: 0, width: width, height: 60)
            xOffset += width
        }
    }
}

class BattingTableViewCell: UITableViewCell {
    var rowColour: UIColor = .clear
    
    private let labels: [UILabel] = [
        UILabel(), UILabel(), UILabel(), UILabel(), UILabel(),
        UILabel(), UILabel(), UILabel(), UILabel()
    ]
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Colors.AccentColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupRow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupRow()
    }
    
    private func setupRow() {
        contentView.backgroundColor = rowColour
        selectionStyle = .none
        
        for label in labels {
            label.font = UIFont.systemFont(ofSize: 11)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            contentView.addSubview(label)
        }
        
        contentView.addSubview(separator)
        layoutRowLabels()
    }
    
    private func layoutRowLabels() {
        let totalWidth = UIScreen.main.bounds.width
        let nameWidth = totalWidth * 0.18 // 21% for "Name"
        let regularWidth = totalWidth * 0.09 // 7% for regular labels
        let expandedWidth = totalWidth * 0.14 // 15% for "Nat's Rnk" and "Wrld Rnk"
        
        var xOffset: CGFloat = 0
        
        for (index, label) in labels.enumerated() {
            let width: CGFloat
            if index == 0 {
                width = nameWidth
            } else if index == 7 || index == 8 {
                width = expandedWidth
            } else {
                width = regularWidth
            }
            
            label.frame = CGRect(
                x: xOffset.rounded(), // Ensure no fractional offsets
                y: 0,
                width: width, // Round width to avoid fractional pixels
                height: 50
            )
            xOffset += width
        }
        
        // Layout for separator
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(with data: [String], isOdd: Bool) {
        for (index, value) in data.enumerated() {
            let label = labels[index]
            label.text = value
            label.numberOfLines = index == 0 ? 2 : 1
            label.textColor = index % 2 == 0 ? .black : Constant.Colors.AccentColor
            //label.backgroundColor = isOdd ? .white : .lightGray
        }
    }
}
