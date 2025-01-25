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
    
    let viewController: LoginViewController
    
    init(with window: UIWindow?) {
        self.window = window
        
        let loginViewModel = DefaultLoginViewModel()
        let loginView = LoginView(with: loginViewModel)
        viewController = LoginViewController(with: loginView, and: loginViewModel)
        viewController.coordinator = self
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func navigateToProfile() {
        Logger.log("navigateToProfile called")
        childCoordinators.removeAll()
        childCoordinators.append(ProfileCoordinator(navigationController: navigationController))
        childCoordinators.first?.start()
    }
}
