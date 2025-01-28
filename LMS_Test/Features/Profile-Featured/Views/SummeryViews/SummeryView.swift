//
//  SummeryView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class SummeryView : BindView<FeaturedViewModel> {
    
    private(set) lazy var firstStackView: FirstStackView = {
        let stackView = FirstStackView(with: viewModel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var secondStackView: SecondStackView = {
        let stackView = SecondStackView(with: viewModel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var topPlayersView: TOPPlayersView = {
        let view = TOPPlayersView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var squadListView: SquadListView = {
        let view = SquadListView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var recentVideosView: RecentVideosView = {
        let view = RecentVideosView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descAndHonsView: DescAndHonsView = {
        let view = DescAndHonsView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var recentResultsView: RecentResultsView = {
        let view = RecentResultsView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var upcomingFixturesView: UpcomingResultsView = {
        let view = UpcomingResultsView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override func setupViews() {
        addSubview(firstStackView)
        addSubview(secondStackView)
        addSubview(topPlayersView)
        addSubview(squadListView)
        addSubview(recentVideosView)
        addSubview(descAndHonsView)
        addSubview(recentResultsView)
        addSubview(upcomingFixturesView)

        topPlayersView.collectionView.reloadData()
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            firstStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            firstStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            firstStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 16),
            secondStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            secondStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            secondStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            topPlayersView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 16),
            topPlayersView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            topPlayersView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            topPlayersView.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        NSLayoutConstraint.activate([
            squadListView.topAnchor.constraint(equalTo: topPlayersView.bottomAnchor, constant: 16),
            squadListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            squadListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            squadListView.heightAnchor.constraint(equalToConstant: 550)
        ])
        
        NSLayoutConstraint.activate([
            recentVideosView.topAnchor.constraint(equalTo: squadListView.bottomAnchor, constant: 16),
            recentVideosView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentVideosView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recentVideosView.heightAnchor.constraint(equalToConstant: 1120)
        ])
        
        NSLayoutConstraint.activate([
            descAndHonsView.topAnchor.constraint(equalTo: recentVideosView.bottomAnchor, constant: 16),
            descAndHonsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descAndHonsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            descAndHonsView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            recentResultsView.topAnchor.constraint(equalTo: descAndHonsView.bottomAnchor, constant: 16),
            recentResultsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentResultsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recentResultsView.heightAnchor.constraint(equalToConstant: 790)
        ])
        
        NSLayoutConstraint.activate([
            upcomingFixturesView.topAnchor.constraint(equalTo: recentResultsView.bottomAnchor, constant: 16),
            upcomingFixturesView.leadingAnchor.constraint(equalTo: leadingAnchor),
            upcomingFixturesView.trailingAnchor.constraint(equalTo: trailingAnchor),
            upcomingFixturesView.heightAnchor.constraint(equalToConstant: 690)
        ])
    }
}
