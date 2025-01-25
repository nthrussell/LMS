//
//  LoginViewController.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class LoginViewController: BindViewController<LoginView, LoginViewModel> {
    var coordinator: LoginCoordinator?
    var onLoginSuccess: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = view.tintColor
        
        didTapLogin()
    }
    
    func didTapLogin() {
        rootView.onTapBiometric = { [weak self] status in
            guard let self else { return }
            switch status {
            case true:
                onLoginSuccess?()
            case false:
                Logger.log("Biometric Login failed")
            }
        }
    }
}
