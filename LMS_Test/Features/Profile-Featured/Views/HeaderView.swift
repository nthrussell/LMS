//
//  HeaderView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit
import Kingfisher

class FeatureHeaderView: BindView<FeaturedViewModel> {
    
    private(set) lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
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
        imageView.backgroundColor = .white
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
        addSubview(headerView)
        headerView.addSubview(teamLogoImageView)
        headerView.addSubview(teamNameLabel)
        headerView.addSubview(sponsorImageView)
        headerView.addSubview(sponsorLabel)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 135)
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
            teamNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
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
    }
    
    func updateUI(teamDescription: TeamDescription) {
        Logger.log("HeaderView updateUI Called")
        let teamURL = URL(string: teamDescription.teamLogo ?? "")
        teamLogoImageView.kf.setImage(with: teamURL)
        teamNameLabel.text = teamDescription.teamName
        let sponsorURL = URL(string: teamDescription.sponsorLogo ?? "")
        sponsorImageView.kf.setImage(with: sponsorURL)
    }
    
}
