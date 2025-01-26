//
//  FeaturedView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class FeaturedView: BindView<FeaturedViewModel> {
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Name"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var sponsorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var sponsorLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Sponsor"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Buttons for tabs
    private(set) lazy var summaryButton: UIButton = createTabButton(title: "Summary", tag: 0)
    private(set) lazy var battingButton: UIButton = createTabButton(title: "Batting", tag: 1)
    private(set) lazy var bowlingButton: UIButton = createTabButton(title: "Bowling", tag: 2)
        
    private(set) lazy var summaryView: UIView = {
        let view = SummeryView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var battingView: UIView = {
        let view = BattingView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var bowlingView: UIView = {
        let view = BowlingView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        headerView.addSubview(teamLogoImageView)
        headerView.addSubview(teamNameLabel)
        headerView.addSubview(sponsorImageView)
        headerView.addSubview(sponsorLabel)
        
        // Add buttons directly to the contentView
        contentView.addSubview(summaryButton)
        contentView.addSubview(battingButton)
        contentView.addSubview(bowlingButton)
        
        // Add container views
        addSubview(summaryView)
        addSubview(battingView)
        addSubview(bowlingView)
        
        // Make "Summary" tab selected by default
        updateSelectedTab(index: 0)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 135)
        ])
        
        NSLayoutConstraint.activate([
            teamLogoImageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            teamLogoImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
            teamLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            teamLogoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            teamNameLabel.topAnchor.constraint(equalTo: teamLogoImageView.bottomAnchor, constant: 8),
            teamNameLabel.leadingAnchor.constraint(equalTo: teamLogoImageView.leadingAnchor),
            teamNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            sponsorImageView.centerYAnchor.constraint(equalTo: teamLogoImageView.centerYAnchor),
            sponsorImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
            sponsorImageView.widthAnchor.constraint(equalToConstant: 150),
            sponsorImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            sponsorLabel.topAnchor.constraint(equalTo: teamLogoImageView.bottomAnchor, constant: -10),
            sponsorLabel.trailingAnchor.constraint(equalTo: sponsorImageView.trailingAnchor),
            sponsorLabel.leadingAnchor.constraint(equalTo: sponsorImageView.leadingAnchor)
        ])
        
        // Buttons layout
        NSLayoutConstraint.activate([
            summaryButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            summaryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            summaryButton.widthAnchor.constraint(equalToConstant: 100),
            summaryButton.heightAnchor.constraint(equalToConstant: 40),
            
            battingButton.topAnchor.constraint(equalTo: summaryButton.topAnchor),
            battingButton.leadingAnchor.constraint(equalTo: summaryButton.trailingAnchor, constant: 5),
            battingButton.widthAnchor.constraint(equalToConstant: 100),
            battingButton.heightAnchor.constraint(equalToConstant: 40),
            
            bowlingButton.topAnchor.constraint(equalTo: summaryButton.topAnchor),
            bowlingButton.leadingAnchor.constraint(equalTo: battingButton.trailingAnchor, constant: 5),
            bowlingButton.widthAnchor.constraint(equalToConstant: 100),
            bowlingButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            summaryView.topAnchor.constraint(equalTo: summaryButton.bottomAnchor, constant: 8),
            summaryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            summaryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            battingView.topAnchor.constraint(equalTo: summaryButton.bottomAnchor, constant: 8),
            battingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            battingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            battingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bowlingView.topAnchor.constraint(equalTo: summaryButton.bottomAnchor, constant: 8),
            bowlingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bowlingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bowlingView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // ContentView Bottom Constraint
       NSLayoutConstraint.activate([
           contentView.bottomAnchor.constraint(equalTo: summaryView.bottomAnchor)
       ])
    }
    
    private func createTabButton(title: String, tag: Int) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constant.Colors.AccentColor // Default color for unselected state
        button.layer.cornerRadius = 5
        button.tag = tag
        button.isEnabled = true
        button.addTarget(self, action: #selector(didTapTab), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func createContainerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true // Hidden by default
        return view
    }
    
    @objc private func didTapTab(sender: UIButton) {
        Logger.log("didTap sender: \(sender.tag)")
        updateSelectedTab(index: sender.tag)
    }
    
    private func updateSelectedTab(index: Int) {
        [summaryButton, battingButton, bowlingButton].enumerated().forEach { (i, button) in
            button.backgroundColor = (i == index) ? Constant.Colors.deepGreenColor : Constant.Colors.AccentColor
        }
        
        [summaryView, battingView, bowlingView].enumerated().forEach { (i, view) in
            view.isHidden = (i != index)
        }
    }
}
