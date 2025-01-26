//
//  TOPPlayersView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class TOPPlayersView: BindView<FeaturedViewModel> {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOP PLAYERS"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func setupViews() {
        addSubview(titleLabel)
        addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setupLayouts() {

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

extension TOPPlayersView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as? PlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension TOPPlayersView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 400)
    }
}

class PlayerCollectionViewCell: UICollectionViewCell {

    static let identifier = "PlayerCollectionViewCell"

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)
        tableView.register(PlayerTableHeaderView.self, forHeaderFooterViewReuseIdentifier: PlayerTableHeaderView.identifier)
        tableView.register(PlayerTableFooterView.self, forHeaderFooterViewReuseIdentifier: PlayerTableFooterView.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 60
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 60
        tableView.sectionFooterHeight = UITableView.automaticDimension
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
        //contentView.addSubview(tableView)
        //tableView.delegate = self
        //tableView.dataSource = self

//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
//        if newWindow != nil {
//            tableView.reloadData() // Reload data when the view is added to the hierarchy
//        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlayerCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PlayerTableHeaderView.identifier) as? PlayerTableHeaderView else {
            return nil
        }
        return header
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: PlayerTableFooterView.identifier) as? PlayerTableFooterView else {
            return nil
        }
        return footer
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
}

class PlayerTableViewCell: UITableViewCell {

    static let identifier = "PlayerTableViewCell"

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let roundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nationalityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let upLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let downLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(numberLabel)
        contentView.addSubview(roundImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nationalityImageView)
        contentView.addSubview(upLabel)
        contentView.addSubview(downLabel)

        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            roundImageView.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 8),
            roundImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            roundImageView.widthAnchor.constraint(equalToConstant: 40),
            roundImageView.heightAnchor.constraint(equalToConstant: 40),

            nameLabel.leadingAnchor.constraint(equalTo: roundImageView.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            nationalityImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nationalityImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nationalityImageView.widthAnchor.constraint(equalToConstant: 20),
            nationalityImageView.heightAnchor.constraint(equalToConstant: 20),

            upLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            upLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),

            downLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            downLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PlayerTableHeaderView: UITableViewHeaderFooterView {

    static let identifier = "PlayerTableHeaderView"

    private let titleLabels: [UILabel] = {
        return (0..<4).map { _ in
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
    }()

    private let roundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    private func setupViews() {
        for label in titleLabels {
            contentView.addSubview(label)
        }
        contentView.addSubview(roundImageView)

        NSLayoutConstraint.activate([
            titleLabels[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabels[0].topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            titleLabels[1].leadingAnchor.constraint(equalTo: titleLabels[0].trailingAnchor, constant: 8),
            titleLabels[1].topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            titleLabels[2].leadingAnchor.constraint(equalTo: titleLabels[1].trailingAnchor, constant: 8),
            titleLabels[2].topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            titleLabels[3].leadingAnchor.constraint(equalTo: titleLabels[2].trailingAnchor, constant: 8),
            titleLabels[3].topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            roundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            roundImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            roundImageView.widthAnchor.constraint(equalToConstant: 50),
            roundImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PlayerTableFooterView: UITableViewHeaderFooterView {

    static let identifier = "PlayerTableFooterView"

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("SEE FULL LIST →", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
