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
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    private(set) lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top_nav")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"menue-icon")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"LMS-Logo")
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var featuredLabel: UILabel = {
        let label = UILabel()
        label.text = "Featured"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
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
        label.textColor = .white.withAlphaComponent(0.7)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(proTapped))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var indicatorBar: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Colors.proSegmentColor
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
        addSubview(backgroundImageView)
        addSubview(customNavigationBar)
        customNavigationBar.addSubview(menuImageView)
        customNavigationBar.addSubview(logoImageView)
        customNavigationBar.addSubview(logoutButton)
        
        addSubview(segmentsContainerView)
        segmentsContainerView.addSubview(featuredLabel)
        segmentsContainerView.addSubview(proLabel)
        segmentsContainerView.addSubview(indicatorBar)
        
        addSubview(contentContainerView)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            menuImageView.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: 16),
            menuImageView.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor, constant: 15),
            menuImageView.widthAnchor.constraint(equalToConstant: 20),
            menuImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 10),
            logoImageView.centerYAnchor.constraint(equalTo: menuImageView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 30),
            logoImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 24),
            logoutButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            segmentsContainerView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            segmentsContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentsContainerView.heightAnchor.constraint(equalToConstant: 40)
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
            indicatorBar.heightAnchor.constraint(equalToConstant: 5),
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

