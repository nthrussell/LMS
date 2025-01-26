//
//  FeaturedView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class FeaturedView: BindView<FeaturedViewModel> {
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Name" 
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var sponsorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var sponsorLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Sponsor"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerView)
        
        headerView.addSubview(teamLogoImageView)
        headerView.addSubview(teamNameLabel)
        headerView.addSubview(sponsorImageView)
        headerView.addSubview(sponsorLabel)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 135) // Adjust height as needed
        ])
        
        NSLayoutConstraint.activate([
            teamLogoImageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            teamLogoImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
            teamLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            teamLogoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            teamNameLabel.topAnchor.constraint(equalTo: teamLogoImageView.bottomAnchor, constant: 8),
            teamNameLabel.leadingAnchor.constraint(equalTo: teamLogoImageView.leadingAnchor),
            teamNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            sponsorImageView.centerYAnchor.constraint(equalTo: teamLogoImageView.centerYAnchor),
            sponsorImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
            sponsorImageView.widthAnchor.constraint(equalToConstant: 150),
            sponsorImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            sponsorLabel.topAnchor.constraint(equalTo: teamLogoImageView.bottomAnchor, constant: -10),
            sponsorLabel.trailingAnchor.constraint(equalTo: sponsorImageView.trailingAnchor),
            sponsorLabel.leadingAnchor.constraint(equalTo: sponsorImageView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16)
        ])
    }
}
