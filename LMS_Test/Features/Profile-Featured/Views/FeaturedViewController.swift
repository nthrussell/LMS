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
        
        viewModel.callApi {
            Logger.log("api called")
            if let desc = self.viewModel.teamDescription,
               let firstStack = self.viewModel.firstStack,
               let secondStack = self.viewModel.secondStack {
                self.rootView.headerView.updateUI(teamDescription: desc)
                self.rootView.summaryView.firstStackView.updateUI(with: firstStack)
                self.rootView.summaryView.secondStackView.updateUI(with: secondStack)

            }
            
            if let topBatsman = self.viewModel.topBatsman,
               let topBowlers = self.viewModel.topBowler,
               let topAllRounder = self.viewModel.topAllRounder {
                var array : [[TopPlayer]] = []
                array.append(topBatsman)
                array.append(topBowlers)
                array.append(topAllRounder)
                Logger.log("Top player Array is: \(array)")
                Logger.log("Top player Array count: \(array.count)")

                self.rootView.summaryView.topPlayersView.update(with: array)
            }
            
            self.rootView.headerView.layoutIfNeeded()
            self.rootView.tableView.reloadData()
        }
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
