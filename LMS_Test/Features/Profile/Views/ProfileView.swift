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
    
    // Menu icon on the left
    private(set) lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"LMS-Menu") // Example icon
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Logout button on the right
    private(set) lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        let logoutImage = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        button.setImage(logoutImage, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func setupViews() {
        addSubview(customNavigationBar)
        
        customNavigationBar.addSubview(menuImageView)
        customNavigationBar.addSubview(logoutButton)
    }
    
    override func setupLayouts() {
        // Navigation bar constraints
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        // Menu icon constraints
        NSLayoutConstraint.activate([
            menuImageView.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: 16),
            menuImageView.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor),
            menuImageView.widthAnchor.constraint(equalToConstant: 64),
            menuImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Logout button constraints
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor)
        ])
    }
    
    @objc private func logoutTapped() {
        print("Logout button tapped")
    }
}
