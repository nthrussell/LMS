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
    
    // MARK: - Child Coordinators
    private let featuredCoordinator = FeaturedCoordinator()
    private let proCoordinator = ProCoordinator()
    
    // Track the current embedded navigation controller
    private var currentNavController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 1) Start each coordinator once
        featuredCoordinator.start()
        proCoordinator.start()
        
        // 2) Display "Featured" by default
        displayChildCoordinator(featuredCoordinator)
        moveIndicator(to: 0)
        
        // 3) Handle segment taps
        rootView.featuredSegmentTapped = { [weak self] in
            guard let self = self else { return }
            self.displayChildCoordinator(self.featuredCoordinator)
            self.moveIndicator(to: 0)
        }
        rootView.proSegmenttapped = { [weak self] in
            guard let self = self else { return }
            self.displayChildCoordinator(self.proCoordinator)
            self.moveIndicator(to: 1)
        }
        
        // 4) Setup logout closure
        didTapLogout()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true // Hides the status bar
    }
    
    private func didTapLogout() {
        rootView.logOutTapped = { [weak self] in
            guard let self = self else { return }
            self.onLogout?()
        }
    }
    
    /// Dynamically embed one coordinator’s navigation controller in the content container
    private func displayChildCoordinator(_ coordinator: Coordinator) {
        // 1) Remove any currently displayed navigation controller
        if let current = currentNavController {
            current.view.removeFromSuperview()
            current.removeFromParent()
        }
        
        // 2) Determine which navController we’re embedding
        let navController: UINavigationController?
        switch coordinator {
        case let featured as FeaturedCoordinator:
            navController = featured.navigationController
        case let pro as ProCoordinator:
            navController = pro.navigationController
        default:
            navController = nil
        }
        
        guard let newNav = navController else { return }
        
        // 3) Add the coordinator's nav controller as a child
        addChild(newNav)
        rootView.contentContainerView.addSubview(newNav.view)
        newNav.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newNav.view.topAnchor.constraint(equalTo: rootView.contentContainerView.topAnchor),
            newNav.view.bottomAnchor.constraint(equalTo: rootView.contentContainerView.bottomAnchor),
            newNav.view.leadingAnchor.constraint(equalTo: rootView.contentContainerView.leadingAnchor),
            newNav.view.trailingAnchor.constraint(equalTo: rootView.contentContainerView.trailingAnchor)
        ])
        
        newNav.didMove(toParent: self)
        currentNavController = newNav
    }
    
    /// Moves the indicator bar under the selected segment
    private func moveIndicator(to index: Int) {
        guard let leadingConstraint = rootView.indicatorLeadingConstraint else { return }
        let segmentWidth = rootView.segmentsContainerView.frame.width / 2
        
        UIView.animate(withDuration: 0.3) {
            leadingConstraint.constant = segmentWidth * CGFloat(index)
            self.view.layoutIfNeeded()
        }
    }
}
