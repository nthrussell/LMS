//
//  LoginViewController.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class LoginViewController: BindViewController<LoginView, LoginViewModel> {
    weak var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "LMS"
        view.backgroundColor = view.tintColor
    }
}
