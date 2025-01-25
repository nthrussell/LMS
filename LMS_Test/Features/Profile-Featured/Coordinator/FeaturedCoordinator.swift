//
//  FeaturedCoordinator.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

final class FeaturedCoordinator: Coordinator {
    lazy var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController = .init()
    
    func start() {
        let featuredViewModel = DefaultFeaturedViewModel()
        let featuredView = FeaturedView(with: featuredViewModel)
        let featuredViewController = FeaturedViewController(with: featuredView, and: featuredViewModel)
        featuredViewController.coordinator = self
        
        navigationController.setViewControllers([featuredViewController], animated: false)
    }
}
