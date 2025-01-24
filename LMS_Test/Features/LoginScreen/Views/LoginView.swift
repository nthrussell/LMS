//
//  LoginView.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class LoginView: BindView<LoginViewModel> {
    
    private(set) lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LMS")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(Constant.Colors.AccentColor, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var loginBiometricBox:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lmsSegmentedControl: LMSegmentedControl = {
        let segControl = LMSegmentedControl(
            frame: CGRect(x: 0, y: 0, width: 100, height: 100),
            buttonTitle: ["Fingerprint","Face"])
        segControl.textColor = .black
        segControl.selectorTextColor = .black
        segControl.backgroundColor = Constant.Colors.SegmentColorBG
        segControl.layer.cornerRadius = 20
        segControl.clipsToBounds = true
        segControl.translatesAutoresizingMaskIntoConstraints = false
        return segControl
    }()
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(loginButton)
        addSubview(loginBiometricBox)
        
        loginBiometricBox.addSubview(lmsSegmentedControl)
        lmsSegmentedControl.delegate = self
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constant.Screen.height * 0.55)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            loginButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            loginBiometricBox.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            loginBiometricBox.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            loginBiometricBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginBiometricBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loginBiometricBox.heightAnchor.constraint(equalToConstant: Constant.Screen.height * 0.25),
        ])
        
        NSLayoutConstraint.activate([
            lmsSegmentedControl.topAnchor.constraint(equalTo: loginBiometricBox.topAnchor, constant: 10),
            lmsSegmentedControl.centerXAnchor.constraint(equalTo: loginBiometricBox.centerXAnchor),
            lmsSegmentedControl.leadingAnchor.constraint(equalTo: loginBiometricBox.leadingAnchor, constant: 16),
            lmsSegmentedControl.trailingAnchor.constraint(equalTo: loginBiometricBox.trailingAnchor, constant: -16),
            lmsSegmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    func tapAction() {
        self.loginButton.isEnabled = false
        self.loginButton.isHidden = true
        self.loginBiometricBox.isHidden = false
    }
}

extension LoginView: LMSegmentedControlDelegate {
    func segSelectedIndexChange(to index: Int) {
        switch index {
        case 0:
            Logger.log("FingerPrint")
        case 1:
            Logger.log("Face")
        default:
            break
        }
    }
}
