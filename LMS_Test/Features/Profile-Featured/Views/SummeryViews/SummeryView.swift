//
//  SummeryView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class SummeryView : BindView<FeaturedViewModel> {
    
    private(set) lazy var firstStackView: UIView = {
        let stackView = FirstStackView(with: viewModel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var secondStackView: UIView = {
        let stackView = SecondStackView(with: viewModel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var topPlayersView: UIView = {
        let view = TOPPlayersView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        addSubview(firstStackView)
        addSubview(secondStackView)
        addSubview(topPlayersView)
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
            //topPlayersView.heightAnchor.constraint(equalToConstant: 400),
            //topPlayersView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
