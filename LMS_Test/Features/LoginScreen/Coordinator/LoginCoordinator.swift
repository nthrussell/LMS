//
//  LoginCoordinator.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

final class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private weak var window: UIWindow?
        
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let loginViewModel = DefaultLoginViewModel()
        let loginView = LoginView(with: loginViewModel)
        let viewController = LoginViewController(with: loginView, and: loginViewModel)
        viewController.coordinator = self
        viewController.onLoginSuccess = { [weak self] in
            guard let self else { return }
            Logger.log("Login successful, go to profile")
            LoginManager.shared.logIn()
            let profileCoordinator = ProfileCoordinator(with: self.window)
            profileCoordinator.start()
        }
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
