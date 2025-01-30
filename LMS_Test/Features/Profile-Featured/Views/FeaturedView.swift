//
//  FeaturedView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class FeaturedView: BindView<FeaturedViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = Constant.Colors.AccentColor
        return activityIndicator
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Constant.Colors.BGColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") // Keep this for UITableViewCell
        return tableView
    }()
    
    private(set) lazy var headerView: FeatureHeaderView = {
        let view = FeatureHeaderView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var buttons = ["Summary", "Batting", "Bowling", "All Rounders"]
    private var selectedTabIndex: Int = 0
    
    private lazy var buttonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        return collectionView
    }()
    
    private(set) lazy var swipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swipe")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var summaryView: SummeryView = {
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
    
    override func setupViews() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 // Header, buttons, and dynamic content
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        switch indexPath.section {
        case 0:
            cell.contentView.addSubview(headerView)
            NSLayoutConstraint.activate([
                headerView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                headerView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                headerView.heightAnchor.constraint(equalToConstant: 135)
            ])
        case 1:
            cell.contentView.addSubview(buttonCollectionView)
            NSLayoutConstraint.activate([
                buttonCollectionView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
                buttonCollectionView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
                buttonCollectionView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
                buttonCollectionView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -2),
                buttonCollectionView.heightAnchor.constraint(equalToConstant: 40)
            ])
            
          
        case 2:
            cell.contentView.addSubview(swipeImageView)
            NSLayoutConstraint.activate([
                swipeImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                swipeImageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
                swipeImageView.heightAnchor.constraint(equalToConstant: 12),
                swipeImageView.widthAnchor.constraint(equalToConstant: 80),
            ])

        case 3:
            let dynamicView: UIView
            switch selectedTabIndex {
            case 0: dynamicView = summaryView
            case 1: dynamicView = battingView
            case 2: dynamicView = bowlingView
            case 3: dynamicView = UIView()
            default: fatalError("Invalid tab index")
            }
            
            cell.contentView.addSubview(dynamicView)
            NSLayoutConstraint.activate([
                dynamicView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                dynamicView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                dynamicView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                dynamicView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                dynamicView.heightAnchor.constraint(equalToConstant: 4800)
            ])
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           switch indexPath.section {
           case 2:
               return swipeImageView.image?.size.height ?? 12
           default:
               return UITableView.automaticDimension
           }
       }
}

extension FeaturedView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as! ButtonCollectionViewCell
        cell.configure(title: buttons[indexPath.item], isSelected: indexPath.item == selectedTabIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTabIndex = indexPath.item
        collectionView.reloadData()
        tableView.reloadSections(IndexSet(integer: 3), with: .automatic)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 35)
    }
}

class ButtonCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ButtonCollectionViewCell"
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constant.Colors.AccentColor
        button.layer.cornerRadius = 5
        button.isUserInteractionEnabled = false // Prevent interaction inside cell
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        button.frame = contentView.bounds
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, isSelected: Bool) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = isSelected ? Constant.Colors.deepGreenColor : Constant.Colors.AccentColor
    }
}
