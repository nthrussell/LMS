//
//  LoginView.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class LoginView: BindView<LoginViewModel> {
    
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LMS")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Start Local, Go Global"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private(set) lazy var lmsSegmentedControl: LMSegmentedControl = {
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
    
    private(set) lazy var confirmBioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.text = "Confirm Biometric"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var scanLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Scan Your Finger"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var biometricButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setImage(UIImage(named:"FingerPrint"), for: .normal)
        
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(biometricButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var onTapBiometric: ((_ status: Bool) -> Void)?
    
    override func setupViews() {
        addSubview(backgroundImageView)
        addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(taglineLabel)
        containerView.addSubview(loginButton)
        containerView.addSubview(loginBiometricBox)
        
        loginBiometricBox.addSubview(lmsSegmentedControl)
        lmsSegmentedControl.delegate = self
        
        loginBiometricBox.addSubview(confirmBioLabel)
        loginBiometricBox.addSubview(scanLabel)
        loginBiometricBox.addSubview(biometricButton)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constant.Screen.height * 0.2),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constant.Screen.height * 0.2),
            imageView.widthAnchor.constraint(equalToConstant: Constant.Screen.height * 0.2)
        ])
        
        NSLayoutConstraint.activate([
            taglineLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            taglineLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            taglineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            taglineLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 60),
            loginButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            loginBiometricBox.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 60),
            loginBiometricBox.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            loginBiometricBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            loginBiometricBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            loginBiometricBox.heightAnchor.constraint(equalToConstant: Constant.Screen.height * 0.25),
        ])
        
        NSLayoutConstraint.activate([
            lmsSegmentedControl.topAnchor.constraint(equalTo: loginBiometricBox.topAnchor, constant: 10),
            lmsSegmentedControl.centerXAnchor.constraint(equalTo: loginBiometricBox.centerXAnchor),
            lmsSegmentedControl.leadingAnchor.constraint(equalTo: loginBiometricBox.leadingAnchor, constant: 16),
            lmsSegmentedControl.trailingAnchor.constraint(equalTo: loginBiometricBox.trailingAnchor, constant: -16),
            lmsSegmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            confirmBioLabel.topAnchor.constraint(equalTo: lmsSegmentedControl.bottomAnchor, constant: 15),
            confirmBioLabel.centerXAnchor.constraint(equalTo: lmsSegmentedControl.centerXAnchor),
            confirmBioLabel.leadingAnchor.constraint(equalTo: loginBiometricBox.leadingAnchor, constant: 16),
            confirmBioLabel.trailingAnchor.constraint(equalTo: loginBiometricBox.trailingAnchor, constant: -16),
            confirmBioLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            scanLabel.topAnchor.constraint(equalTo: confirmBioLabel.bottomAnchor, constant: 5),
            scanLabel.centerXAnchor.constraint(equalTo: lmsSegmentedControl.centerXAnchor),
            scanLabel.leadingAnchor.constraint(equalTo: confirmBioLabel.leadingAnchor),
            scanLabel.trailingAnchor.constraint(equalTo: confirmBioLabel.trailingAnchor),
            scanLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            biometricButton.topAnchor.constraint(equalTo: scanLabel.bottomAnchor, constant: 15),
            biometricButton.centerXAnchor.constraint(equalTo: scanLabel.centerXAnchor),
            biometricButton.widthAnchor.constraint(equalToConstant: 50),
            biometricButton.heightAnchor.constraint(equalToConstant: 50)
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
            scanLabel.text = "Scan Your Finger"
            biometricButton.setImage(UIImage(named:"FingerPrint"), for: .normal)
        case 1:
            scanLabel.text = "Use Face Recognition"
            biometricButton.setImage(UIImage(named:"FaceID"), for: .normal)
        default:
            break
        }
    }
}

extension LoginView {
    @objc private
    func biometricButtonTap() {
        viewModel.authenticateUser() { [weak self] status in
            guard let self else { return }
            switch status {
            case .success:
                self.onTapBiometric?(true)
            case .failure:
                self.onTapBiometric?(false)
            }
        }
    }
}
