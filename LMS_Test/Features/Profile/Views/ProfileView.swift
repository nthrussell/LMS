//
//  ProfileView.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class ProfileView: BindView<ProfileViewModel>  {
    private(set) lazy var customNavigationBar: UIView = {
        let navigationBar = UIView()
        navigationBar.backgroundColor = Constant.Colors.AccentColor
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    private(set) lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"LMS-Menu")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        let logoutImage = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        button.setImage(logoutImage, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        return button
    }()
    
    private(set) lazy var segmentsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Colors.AccentColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var featuredLabel: UILabel = {
        let label = UILabel()
        label.text = "Featured"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(featuredTapped))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private(set) lazy var proLabel: UILabel = {
        let label = UILabel()
        label.text = "Pro"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(proTapped))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var indicatorBar: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var indicatorLeadingConstraint: NSLayoutConstraint?
    
    var featuredSegmentTapped: (() -> Void)?
    var proSegmenttapped: (() -> Void)?
    var logOutTapped: (() -> Void)?
    
    override func setupViews() {
        addSubview(customNavigationBar)
        customNavigationBar.addSubview(menuImageView)
        customNavigationBar.addSubview(logoutButton)
        
        addSubview(segmentsContainerView)
        segmentsContainerView.addSubview(featuredLabel)
        segmentsContainerView.addSubview(proLabel)
        segmentsContainerView.addSubview(indicatorBar)
        
        addSubview(contentContainerView)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            menuImageView.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: 16),
            menuImageView.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor),
            menuImageView.widthAnchor.constraint(equalToConstant: 64),
            menuImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            segmentsContainerView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            segmentsContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentsContainerView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            featuredLabel.leadingAnchor.constraint(equalTo: segmentsContainerView.leadingAnchor),
            featuredLabel.topAnchor.constraint(equalTo: segmentsContainerView.topAnchor),
            featuredLabel.bottomAnchor.constraint(equalTo: segmentsContainerView.bottomAnchor),
            featuredLabel.widthAnchor.constraint(equalTo: segmentsContainerView.widthAnchor, multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            proLabel.trailingAnchor.constraint(equalTo: segmentsContainerView.trailingAnchor),
            proLabel.topAnchor.constraint(equalTo: segmentsContainerView.topAnchor),
            proLabel.bottomAnchor.constraint(equalTo: segmentsContainerView.bottomAnchor),
            proLabel.widthAnchor.constraint(equalTo: segmentsContainerView.widthAnchor, multiplier: 0.5),
        ])
        
        indicatorLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: segmentsContainerView.leadingAnchor)
        
        NSLayoutConstraint.activate([
            indicatorBar.bottomAnchor.constraint(equalTo: segmentsContainerView.bottomAnchor),
            indicatorBar.heightAnchor.constraint(equalToConstant: 3),
            indicatorBar.widthAnchor.constraint(equalTo: segmentsContainerView.widthAnchor, multiplier: 0.5),
            indicatorLeadingConstraint!
        ])
        
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: segmentsContainerView.bottomAnchor),
            contentContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func logoutTapped() {
        print("Logout button tapped")
        logOutTapped?()
    }
    
    // MARK: - Segment Actions
    @objc private func featuredTapped() {
        featuredSegmentTapped?()
    }
    
    @objc private func proTapped() {
        proSegmenttapped?()
    }
}

