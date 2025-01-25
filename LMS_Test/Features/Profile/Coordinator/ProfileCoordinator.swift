//
//  ProfileCoordinator.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class ProfileCoordinator: Coordinator {
    lazy var childCoordinators: [Coordinator] = []
    private let window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let profileViewModel = DefaultProfileViewModel()
        let profileView = ProfileView(with: profileViewModel)
        let profileViewController = ProfileViewController(with: profileView, and: profileViewModel)
        profileViewController.coordinator = self
        profileViewController.onLogout = { [weak self] in
            guard let self else { return }
            LoginManager.shared.logOut()
            let loginCoordinator = LoginCoordinator(with: self.window)
            loginCoordinator.start()
        }
        
        window?.rootViewController = profileViewController
        window?.makeKeyAndVisible()
    }
}
