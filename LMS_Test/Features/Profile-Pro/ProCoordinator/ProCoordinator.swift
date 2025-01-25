//
//  ProCoordinator.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

final class ProCoordinator: Coordinator {
    lazy var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController = .init()
    
    func start() {
        let proViewModel = DefaultProViewModel()
        let proView = ProView(with: proViewModel)
        let proViewController = ProViewController(with: proView, and: proViewModel)
        proViewController.coordinator = self
        
        navigationController.setViewControllers([proViewController], animated: false)
    }
}
