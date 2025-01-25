//
//  FeaturedViewController.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class FeaturedViewController: BindViewController<FeaturedView, FeaturedViewModel> {
    weak var coordinator: FeaturedCoordinator?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
