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
        let view = HeaderView(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private var activeViewBottomConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerView)
        
        // Add buttons directly to the contentView
        contentView.addSubview(summaryButton)
        contentView.addSubview(battingButton)
        contentView.addSubview(bowlingButton)
        
        // Add container views
        contentView.addSubview(summaryView)
        contentView.addSubview(battingView)
        contentView.addSubview(bowlingView)
        
        // Make "Summary" tab selected by default
        updateSelectedTab(index: 0)
    }
        
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 135)
        ])
        
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
            summaryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            summaryView.heightAnchor.constraint(equalToConstant: 900),
            summaryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor), // Make the `contentView` follow the height of this view
        ])
        
        NSLayoutConstraint.activate([
            battingView.topAnchor.constraint(equalTo: summaryButton.bottomAnchor, constant: 8),
            battingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            battingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            battingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bowlingView.topAnchor.constraint(equalTo: summaryButton.bottomAnchor, constant: 8),
            bowlingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bowlingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bowlingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
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
        // Update button states
        [summaryButton, battingButton, bowlingButton].enumerated().forEach { (i, button) in
            button.backgroundColor = (i == index) ? Constant.Colors.deepGreenColor : Constant.Colors.AccentColor
        }

        // Hide all views and show the selected one
        [summaryView, battingView, bowlingView].enumerated().forEach { (i, view) in
            view.isHidden = (i != index)
        }

        // Remove the old bottom constraint
        activeViewBottomConstraint?.isActive = false

        // Add a new bottom constraint for the active view
        let activeView = index == 0 ? summaryView : (index == 1 ? battingView : bowlingView)
        activeViewBottomConstraint = activeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        activeViewBottomConstraint?.isActive = true

        // Force layout update
        contentView.layoutIfNeeded()
        scrollView.layoutIfNeeded()
    }
}
