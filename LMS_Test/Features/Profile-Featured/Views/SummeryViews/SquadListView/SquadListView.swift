//
//  SquadListView.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit

class SquadListView: BindView<FeaturedViewModel> {

    // MARK: - Background Views
    private let backgroundA: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Colors.deepGreenColor
        return view
    }()

    private let backgroundB: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Title Label
    private let titleLabel: FormattedTextLabel = {
        let label = FormattedTextLabel()
        label.setColoredText(
            firstText: "SQUAD",
            firstTextColor: .white,
            secondText: "LIST",
            secondTextColor: Constant.Colors.SegmentColor
        )
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    // MARK: - Collection View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0) // Add padding: top 16, left 16
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SquadListCell.self, forCellWithReuseIdentifier: SquadListCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - View All Button
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

    // MARK: - Arrow Image View
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = Constant.Colors.AccentColor
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Setup View
    override func setupViews() {
        addSubview(backgroundA)
        addSubview(backgroundB)
        
        backgroundA.addSubview(titleLabel)
        backgroundA.addSubview(collectionView)
        backgroundA.addSubview(viewAllButton)
        backgroundB.addSubview(arrowImageView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
            
            // Collection View
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: backgroundA.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: backgroundA.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 400),
            
            // View All Button
            viewAllButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            viewAllButton.centerXAnchor.constraint(equalTo: backgroundA.centerXAnchor),
            viewAllButton.widthAnchor.constraint(equalToConstant: 165),
            viewAllButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Background B
            backgroundB.centerYAnchor.constraint(equalTo: backgroundA.centerYAnchor),
            backgroundB.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backgroundB.widthAnchor.constraint(equalToConstant: 50),
            backgroundB.heightAnchor.constraint(equalToConstant: 50),
            
            // Arrow Image View
            arrowImageView.centerXAnchor.constraint(equalTo: backgroundB.centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: backgroundB.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        // Set Z index
        bringSubviewToFront(backgroundB)
    }
}

extension SquadListView:  UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - CollectionView DataSource
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 3
      }

      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquadListCell.identifier, for: indexPath) as? SquadListCell else {
              return UICollectionViewCell()
          }
          //let player = players[indexPath.item]
          //cell.configure(image: player.image, name: player.name, batsman: player.batsman, bowler: player.bowler)
          return cell
      }

      // MARK: - CollectionView Flow Layout Delegate
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 0
      }
}

extension SquadListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 100, height: 400)
    }
}

// MARK: - Collection View Cell
class SquadListCell: UICollectionViewCell {
    static let identifier = "SquadListCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = false // Keep shadow visible
        return view
    }()
    
    private let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Harry Jonson"
        label.textAlignment = .left
        label.textColor = Constant.Colors.deepGreenColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let batsmanLabel: UILabel = {
        let label = UILabel()
        label.text = "Right hand batsman"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = Constant.Colors.AccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bowlerLabel: UILabel = {
        let label = UILabel()
        label.text = "Right arm spin"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = Constant.Colors.AccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(playerImageView)
        containerView.addSubview(playerNameLabel)
        containerView.addSubview(batsmanLabel)
        containerView.addSubview(bowlerLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container View Constraints
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Player Image View Constraints
            playerImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            playerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            playerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            playerImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.75),
            
            // Player Name Label Constraints
            playerNameLabel.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 12),
            playerNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            playerNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            //playerNameLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.1),

            // Batsman Label Constraints
            batsmanLabel.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 4),
            batsmanLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            batsmanLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // Bowler Label Constraints
            bowlerLabel.topAnchor.constraint(equalTo: batsmanLabel.bottomAnchor, constant: 2),
            bowlerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            bowlerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    func configure(image: UIImage, name: String, batsman: String, bowler: String) {
        playerImageView.image = image
        playerNameLabel.text = name
        batsmanLabel.text = batsman
        bowlerLabel.text = bowler
    }
}
