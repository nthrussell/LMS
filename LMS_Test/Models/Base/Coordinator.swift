//
//  Coordinator.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
