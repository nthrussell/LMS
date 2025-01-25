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
    
    private var currentChildVC: UIViewController?
    
    // Child controllers
    private let featuredVC = FeaturedViewController()
    private let proVC = ProViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        displayChildViewController(featuredVC)
        moveIndicator(to: 0)
        
        rootView.featuredSegmentTapped = { [weak self] in
            guard let self else { return }
            displayChildViewController(featuredVC)
            moveIndicator(to: 0)
        }
        
        rootView.proSegmenttapped = { [weak self] in
            guard let self else { return }
            displayChildViewController(proVC)
            moveIndicator(to: 1)
        }
        
        didTapLogout() 
    }
    
    override var prefersStatusBarHidden: Bool {
        return true  // Hide the status bar
    }
    
    private func didTapLogout() {
        rootView.logOutTapped = { [weak self] in
            guard let self else { return }
            self.onLogout?()
        }
    }
    
    private func displayChildViewController(_ vc: UIViewController) {
        if let current = currentChildVC {
            current.willMove(toParent: nil)
            current.view.removeFromSuperview()
            current.removeFromParent()
        }
        
        addChild(vc)
        rootView.contentContainerView.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: rootView.contentContainerView.topAnchor),
            vc.view.bottomAnchor.constraint(equalTo: rootView.contentContainerView.bottomAnchor),
            vc.view.leadingAnchor.constraint(equalTo: rootView.contentContainerView.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: rootView.contentContainerView.trailingAnchor)
        ])
        
        vc.didMove(toParent: self)
        currentChildVC = vc
    }
    
    private func moveIndicator(to index: Int) {
        guard let leadingConstraint = rootView.indicatorLeadingConstraint else { return }
        let segmentWidth = rootView.segmentsContainerView.frame.width / 2
        
        UIView.animate(withDuration: 0.3) {
            leadingConstraint.constant = segmentWidth * CGFloat(index)
            self.view.layoutIfNeeded()
        }
    }
}
