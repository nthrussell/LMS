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
        collectionView.register(TopPlayerCell.self, forCellWithReuseIdentifier: TopPlayerCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var topPlayers: [[TopPlayer]] = [[]]
    
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
            collectionView.heightAnchor.constraint(equalToConstant: 530)
        ])
    }
    
    func update(with topPlayers: [[TopPlayer]]) {
        self.topPlayers = topPlayers
        self.collectionView.reloadData()
    }
}

extension TOPPlayersView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topPlayers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopPlayerCell.identifier, for: indexPath) as? TopPlayerCell else {
            return UICollectionViewCell()
        }
        
        var title = ""
        if indexPath.row == 0 {
            title = "TOP BATSMEN"
        } else if indexPath.row == 1 {
            title = "TOP BOWLERS"
        } else {
            title = "TOP ALL ROUNDERS"
        }
        cell.configure(with: topPlayers[indexPath.row], title: title)
        
        return cell
    }
}

extension TOPPlayersView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 42, height: 530)
    }
}

