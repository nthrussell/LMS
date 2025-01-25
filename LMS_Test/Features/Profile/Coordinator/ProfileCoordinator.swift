//
//  ProfileCoordinator.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class ProfileCoordinator: Coordinator {
    lazy var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        Logger.log("profile navigation is: \(self.navigationController )")
    }
    
    func start() {
        let profileViewModel = DefaultProfileViewModel()
        let profileView = ProfileView(with: profileViewModel)
        let profileViewController = ProfileViewController(with: profileView, and: profileViewModel)
        
        profileViewController.coordinator = self
        
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
