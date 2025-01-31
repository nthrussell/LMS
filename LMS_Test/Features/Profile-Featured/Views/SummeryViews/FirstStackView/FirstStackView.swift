//
//  FirstStackView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//
import UIKit

class FirstStackView : BindView<FeaturedViewModel> {
    
    private(set) lazy var box1: UIView = {
        let view = createBox(title: "Matches", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "box1"
        return view
    }()
    
    private(set) lazy var box2: UIView = {
        let view = createBox(title: "Win Ratio", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "box2"
        return view
    }()
    
    private(set) lazy var box3: UIView = {
        let view = createBox(title: "Wins", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "box3"
        return view
    }()
    
    private(set) lazy var box4: UIView = {
        let view = createBox(title: "Loses", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "box4"
        return view
    }()
    
    private(set) lazy var row1StackView: UIStackView = {
        let row1 = UIStackView(arrangedSubviews: [box1, box2])
        row1.axis = .horizontal
        row1.alignment = .fill
        row1.distribution = .fillEqually
        row1.spacing = 8
        row1.translatesAutoresizingMaskIntoConstraints = false
        row1.accessibilityIdentifier = "row1StackView"
        return row1
    }()
    
    private(set) lazy var row2StackView: UIStackView = {
        // Row 2
        let row2 = UIStackView(arrangedSubviews: [box3, box4])
        row2.axis = .horizontal
        row2.alignment = .fill
        row2.distribution = .fillEqually
        row2.spacing = 8
        row2.translatesAutoresizingMaskIntoConstraints = false
        row2.accessibilityIdentifier = "row2StackView"
        return row2
    }()
    
    private(set) lazy var mainStackView: UIStackView = {
        // Main vertical stack view
        let mainStackView = UIStackView(arrangedSubviews: [row1StackView, row2StackView])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 8
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.accessibilityIdentifier = "mainStackView"
        return mainStackView
    }()
    
    
    override func setupViews() {
        addSubview(mainStackView)
    }
    
    override func setupLayouts() {
        // Set constraints for the main stack view
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createBox(title: String, value: String) -> UIView {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "firstStack_BG")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.cornerRadius = 4
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let container = UIView()
        container.layer.borderWidth = 0.5
        container.layer.borderColor = Constant.Colors.AccentColor.cgColor
        container.layer.cornerRadius = 4
        container.clipsToBounds = true
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        // Explicit height constraint
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Value Label
        let valueLabel = UILabel()
        valueLabel.attributedText = formattedValueText(for: value)
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 1
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        valueLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        // Explicit height constraint
        NSLayoutConstraint.activate([
            valueLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        // Vertical Stack for title and value
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill // Ensures labels take required space
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stack view to the container
        container.addSubview(backgroundImageView)
        container.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: container.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
        ])
        
        return container
    }
    
    private func formattedValueText(for value: String) -> NSAttributedString {
        // Split the value into two parts: the main number and the smaller part
        let parts = value.split(separator: ".", maxSplits: 1, omittingEmptySubsequences: false)
        
        // Define fonts
        let largeFont = UIFont.systemFont(ofSize: 48, weight: .bold)
        let smallFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        // Create a mutable attributed string
        let attributedString = NSMutableAttributedString()
        
        // Add the main number part
        if let mainNumber = parts.first {
            let mainNumberString = NSAttributedString(string: String(mainNumber), attributes: [
                .font: largeFont,
                .foregroundColor: Constant.Colors.AccentColor
            ])
            attributedString.append(mainNumberString)
        }
        
        // Add the smaller part (.13%)
        if parts.count > 1 {
            let smallerPart = ".\(parts[1])"
            let smallerPartString = NSAttributedString(string: smallerPart, attributes: [
                .font: smallFont,
                .foregroundColor: Constant.Colors.AccentColor
            ])
            attributedString.append(smallerPartString)
        }
        
        return attributedString
    }
    
    func updateUI(with firstStack: FirstStack) {
        // Update Matches box
        let matchesValue = "\(firstStack.gamesPlayed)"
        if let matchesLabel = box1.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            matchesLabel.attributedText = formattedValueText(for: matchesValue)
        }
        
        // Update Win Ratio box
        let winRatioValue = String(format: "%.2f%%", firstStack.winRatio)
        if let winRatioLabel = box2.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            winRatioLabel.attributedText = formattedValueText(for: winRatioValue)
        }
        
        // Update Wins box
        let winsValue = "\(firstStack.wins)"
        if let winsLabel = box3.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            winsLabel.attributedText = formattedValueText(for: winsValue)
        }
        
        // Update Loses box
        let losesValue = "\(firstStack.loses)"
        if let losesLabel = box4.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            losesLabel.attributedText = formattedValueText(for: losesValue)
        }
    }
}
