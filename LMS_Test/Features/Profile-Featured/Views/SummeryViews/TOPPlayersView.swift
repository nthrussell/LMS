//
//  TOPPlayersView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class TOPPlayersView: BindView<FeaturedViewModel> {
    
    private let titleLabel: FormattedTextLabel = {
        let label = FormattedTextLabel()
        label.setColoredText(
            firstText: "TOP",
            firstTextColor: .black,
            secondText: "PLAYERS",
            secondTextColor: Constant.Colors.AccentColor
        )
        label.font = UIFont.boldSystemFont(ofSize: 24)
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
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 600)
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
        return CGSize(width: collectionView.frame.width - 42, height: 600)
    }
}

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlayerCollectionViewCell"
    
    // Container View with green border
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = Constant.Colors.AccentColor.cgColor
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOP BATSMEN"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Header View with green background
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Colors.AccentColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Profile Image
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 42 // Circular shape
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Header labels
    private(set) lazy var worldRankingLabel: UILabel = {
        let label = UILabel()
        label.text = "WORLD RANKING: 01"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var nameLabel: FormattedTextLabel = {
        let label = FormattedTextLabel()
        label.setFormattedText(regularText: "MOQBUL", boldText: "KHAWJA")
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var nationalRankLabel: UILabel = {
        let label = UILabel()
        label.text = "National Rank: 01"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var worldRankLabel: UILabel = {
        let label = UILabel()
        label.text = "World Rank: 01"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Row container
    private let rowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Button
    private let seeFullListButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SEE FULL LIST", for: .normal)
        button.setTitleColor(Constant.Colors.AccentColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Colors.AccentColor.cgColor
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(headerView)
        headerView.addSubview(worldRankingLabel)
        headerView.addSubview(nameLabel)
        headerView.addSubview(nationalRankLabel)
        headerView.addSubview(worldRankLabel)
        headerView.addSubview(profileImageView)
        containerView.addSubview(rowStackView)
        containerView.addSubview(seeFullListButton)
        
        for i in 1...5 {
            rowStackView.addArrangedSubview(createRowView(number: "0\(i+1)"))
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container constraints
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Title label
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            // Header view
            headerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            
            // Header labels and profile image
            worldRankingLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 30),
            worldRankingLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: worldRankingLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            
            nationalRankLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nationalRankLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            
            worldRankLabel.topAnchor.constraint(equalTo: nationalRankLabel.bottomAnchor, constant: 4),
            worldRankLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            
            profileImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            profileImageView.widthAnchor.constraint(equalToConstant: 84),
            profileImageView.heightAnchor.constraint(equalToConstant: 84),
            
            // Row stack view
            rowStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            rowStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            rowStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // See full list button
            seeFullListButton.topAnchor.constraint(equalTo: rowStackView.bottomAnchor, constant: 16),
            seeFullListButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            seeFullListButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            seeFullListButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            seeFullListButton.heightAnchor.constraint(equalToConstant: 45),
            seeFullListButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    
    private func createRowView(number: String) -> UIView {
        let rowView = UIView()
        rowView.translatesAutoresizingMaskIntoConstraints = false
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.boldSystemFont(ofSize: 14)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let circularImageView = UIImageView()
        circularImageView.contentMode = .scaleAspectFill
        circularImageView.layer.cornerRadius = 23
        circularImageView.clipsToBounds = true
        circularImageView.backgroundColor = .gray
        circularImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "M A RUSSELL"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = UIImage(named: "BD_Flag")
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let topRightLabel = UILabel()
        topRightLabel.text = "NAT/WRLD RANK"
        topRightLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        topRightLabel.textColor = Constant.Colors.AccentColor.withAlphaComponent(0.5)
        topRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomRightLabel = UILabel()
        bottomRightLabel.text = "41/08"
        bottomRightLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        topRightLabel.textColor = Constant.Colors.AccentColor
        bottomRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let separatorView = UIView()
        separatorView.backgroundColor = Constant.Colors.AccentColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        rowView.addSubview(numberLabel)
        rowView.addSubview(circularImageView)
        rowView.addSubview(titleLabel)
        rowView.addSubview(leftImageView)
        rowView.addSubview(topRightLabel)
        rowView.addSubview(bottomRightLabel)
        rowView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: rowView.leadingAnchor, constant: 16),
            numberLabel.centerYAnchor.constraint(equalTo: rowView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            circularImageView.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 8),
            circularImageView.centerYAnchor.constraint(equalTo: rowView.centerYAnchor),
            circularImageView.widthAnchor.constraint(equalToConstant: 46),
            circularImageView.heightAnchor.constraint(equalToConstant: 46),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: circularImageView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            leftImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            leftImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 20),
            leftImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        
        NSLayoutConstraint.activate([
            topRightLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            topRightLabel.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -12),
            topRightLabel.heightAnchor.constraint(equalToConstant: 14),
        ])
        
        NSLayoutConstraint.activate([
            bottomRightLabel.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -12),
            bottomRightLabel.topAnchor.constraint(equalTo: topRightLabel.bottomAnchor, constant: 4),
            bottomRightLabel.heightAnchor.constraint(equalToConstant: 14),
        ])
        
        NSLayoutConstraint.activate([
            
            separatorView.leadingAnchor.constraint(equalTo: rowView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: rowView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: rowView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return rowView
    }
    
}
