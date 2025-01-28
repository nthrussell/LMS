//
//  PlayerCollectionViewCell.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit
import Kingfisher

class TopPlayerCell: UICollectionViewCell {
    
    static let identifier = "TopPlayerCell"
    
    // Container View with green border
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
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
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Button
    private let seeFullListButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SEE FULL LIST", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16) // Set bold font with size 16
        button.layer.borderWidth = 0.5
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
        
//        for i in 1...5 {
//            rowStackView.addArrangedSubview(createRowView(number: "0\(i+1)"))
//        }
        
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
            seeFullListButton.topAnchor.constraint(equalTo: rowStackView.bottomAnchor, constant: 8),
            seeFullListButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            seeFullListButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            seeFullListButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            seeFullListButton.heightAnchor.constraint(equalToConstant: 45),
            seeFullListButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    
    func configure(with players: [TopPlayer], title: String) {
        // Update the header labels
        if players.count < 1 { return }
        
        titleLabel.text = title
        worldRankingLabel.text = "WORLD RANKING: \(players[0].worldRank)"
        nationalRankLabel.text = "National Rank: \(players[0].nationalRank)"
        worldRankLabel.text = "World Rank: \(players[0].worldRank)"
        
        // Update name label with formatted text
        nameLabel.setFormattedText(regularText: players[0].firstName, boldText: players[0].lastName)
        
        // Load the profile picture
        let url = URL(string: players[0].userPicture)
        profileImageView.kf.setImage(with: url)
        
        updateRows(with: players)
    }
    
    func updateRows(with players: [TopPlayer]) {
        rowStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for i in 1..<players.count {
            let rankText = "\(players[i].nationalRank)/\(players[i].worldRank)"
            let rowView = createRowView(
                imageUrl: players[i].userPicture,
                number: "0\(i+1)",
                rankText: rankText,
                firstName: players[i].firstName,
                lastName: players[i].lastName
            )
            rowStackView.addArrangedSubview(rowView)
        }
    }
    
    private func createRowView(imageUrl:String, number: String, rankText: String, firstName: String, lastName: String) -> UIView {
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
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        let fullName = "\(firstName) \(lastName)"
        let truncatedName = String(fullName.prefix(12))
        titleLabel.text = truncatedName
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = UIImage(named: "BD_Flag")
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let topRightLabel = UILabel()
        topRightLabel.text = "NAT/WRLD RANK"
        topRightLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        topRightLabel.textColor = Constant.Colors.deepGreenColor.withAlphaComponent(0.4)
        topRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomRightLabel = UILabel()
        bottomRightLabel.text = rankText
        bottomRightLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        bottomRightLabel.textColor = Constant.Colors.AccentColor.withAlphaComponent(0.9)
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
        
        circularImageView.kf.setImage(with: URL(string: imageUrl))
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: rowView.leadingAnchor, constant: 16),
            numberLabel.centerYAnchor.constraint(equalTo: rowView.centerYAnchor),
            
            circularImageView.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 8),
            circularImageView.centerYAnchor.constraint(equalTo: rowView.centerYAnchor),
            circularImageView.widthAnchor.constraint(equalToConstant: 46),
            circularImageView.heightAnchor.constraint(equalToConstant: 46),
            
            titleLabel.topAnchor.constraint(equalTo: circularImageView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 8),
            
            leftImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            leftImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 20),
            leftImageView.heightAnchor.constraint(equalToConstant: 20),
            
            topRightLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            topRightLabel.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -12),
            topRightLabel.heightAnchor.constraint(equalToConstant: 14),
            
            bottomRightLabel.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -12),
            bottomRightLabel.topAnchor.constraint(equalTo: topRightLabel.bottomAnchor, constant: 4),
            bottomRightLabel.heightAnchor.constraint(equalToConstant: 14),
            
            separatorView.leadingAnchor.constraint(equalTo: rowView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: rowView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: rowView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return rowView
    }
    
}

