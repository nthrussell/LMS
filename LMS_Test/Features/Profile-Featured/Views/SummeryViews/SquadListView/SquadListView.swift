//
//  SquadListView.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit

class SquadListView: BindView<FeaturedViewModel> {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "squad-list-green")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundA: UIView = {
        let view = UIView()
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
        let button = UIButton(type: .custom)
        let image = UIImage(named: "view_all_right")
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 2
        button.layer.borderColor = Constant.Colors.buttonRed.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Arrow Image View
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow_right")
        imageView.tintColor = Constant.Colors.AccentColor
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var squadList: [SquadListModel]?

    // MARK: - Setup View
    override func setupViews() {
        addSubview(backgroundImageView)
        addSubview(backgroundA)
        addSubview(arrowImageView)
        
        backgroundA.addSubview(titleLabel)
        backgroundA.addSubview(collectionView)
        backgroundA.addSubview(viewAllButton)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Constraints
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
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
            
            // Arrow Image View
            arrowImageView.centerYAnchor.constraint(equalTo: backgroundA.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: backgroundA.trailingAnchor, constant: -16),
            arrowImageView.widthAnchor.constraint(equalToConstant: 50),
            arrowImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        // Set Z index
        bringSubviewToFront(arrowImageView)
    }
    
    func updateUI(with squadList: [SquadListModel]) {
        self.squadList = squadList
        self.collectionView.reloadData()
    }
}

extension SquadListView:  UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - CollectionView DataSource
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return squadList?.count ?? 0
      }

      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquadListCell.identifier, for: indexPath) as? SquadListCell else {
              return UICollectionViewCell()
          }
          
          if let _ = squadList {
              let player = squadList?[indexPath.item]
              cell.configure(
                image: player?.userPicture ?? "",
                name: "\(player?.firstName ?? "") \(player?.lastName ?? "")",
                batsman: player?.playerInfo.rawValue ?? "",
                bowler: player?.playerInfo.rawValue ?? ""
              )
          }
         
          
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
