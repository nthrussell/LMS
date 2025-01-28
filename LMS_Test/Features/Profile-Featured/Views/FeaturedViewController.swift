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
        view.backgroundColor = Constant.Colors.BGColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
