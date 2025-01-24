//
//  LoginCoordinator.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

final class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = .init()
    private weak var window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let loginViewModel = LoginViewModel()
        let loginView = LoginView(with: loginViewModel)
        let loginViewController = LoginViewController(with: loginView, and: loginViewModel)
        loginViewController.coordinator = self
        
        navigationController.setViewControllers([loginViewController], animated: true)

        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
    }
}
