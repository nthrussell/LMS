//
//  ProViewController.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class ProViewController: BindViewController<ProView, ProViewModel> {
    weak var coordinator: ProCoordinator?
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
