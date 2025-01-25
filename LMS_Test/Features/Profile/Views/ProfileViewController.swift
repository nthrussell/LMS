//
//  ProfileViewController.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class ProfileViewController: BindViewController<ProfileView, ProfileViewModel> {
    weak var coordinator: ProfileCoordinator?
    var onLogout: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Logger.log("In the ProfileViewController")
        view.backgroundColor = .white
    }
    
    override var prefersStatusBarHidden: Bool {
        return true  // Hide the status bar
    }
}
