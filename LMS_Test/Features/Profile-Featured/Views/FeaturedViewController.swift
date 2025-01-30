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
        
        rootView.activityIndicator.startAnimating()
        viewModel.callApi {
            self.rootView.activityIndicator.stopAnimating()
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
                self.rootView.summaryView.topPlayersView.update(with: array)
            }
            
            if let recentVideos = self.viewModel.recentVideos {
                self.rootView.summaryView.recentVideosView.updateUI(with: recentVideos)
            }
            
            if let desc = self.viewModel.teamDescription,
               let hons = self.viewModel.honours {
                self.rootView.summaryView.descAndHonsView.updateUI(with: desc, and: hons)
            }
            
            if let recentResults = self.viewModel.recentResults,
               let upcomingFixture = self.viewModel.upcomingFixtures {
                self.rootView.summaryView.recentResultsView.updateUI(with: recentResults)
                self.rootView.summaryView.upcomingFixturesView.updateUI(with: upcomingFixture)
            }
            
            self.viewModel.getSquadList {
                if let squadList = self.viewModel.squadList {
                    self.rootView.summaryView.squadListView.updateUI(with: squadList)
                }
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
