//
//  FirstStackView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//
import UIKit

class FirstStackView : BindView<FeaturedViewModel> {
    
    private(set) lazy var box1: UIView = {
        let view = createBox(title: "Matches", value: "1327")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var box2: UIView = {
        let view = createBox(title: "Win Ratio", value: "64.13%")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var box3: UIView = {
        let view = createBox(title: "Wins", value: "826")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var box4: UIView = {
        let view = createBox(title: "Loses", value: "501")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var row1: UIStackView = {
        let row1 = UIStackView(arrangedSubviews: [box1, box2])
        row1.axis = .horizontal
        row1.alignment = .fill
        row1.distribution = .fillEqually
        row1.translatesAutoresizingMaskIntoConstraints = false
        row1.spacing = 16
        return row1
    }()
    
    private(set) lazy var row2: UIStackView = {
        // Row 2
        let row2 = UIStackView(arrangedSubviews: [box3, box4])
        row2.axis = .horizontal
        row2.alignment = .fill
        row2.distribution = .fillEqually
        row2.spacing = 16 // Space between boxes in the row
        row2.translatesAutoresizingMaskIntoConstraints = false
        return row2
    }()
    
    private(set) lazy var mainStackView: UIStackView = {
        // Main vertical stack view
        let mainStackView = UIStackView(arrangedSubviews: [row1, row2])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 8 // Space between rows
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    
    override func setupViews() {
        addSubview(mainStackView)
    }
    
    override func setupLayouts() {
        // Set constraints for the main stack view
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func createBox(title: String, value: String) -> UIView {
        let container = UIView()
        container.layer.borderWidth = 1
        container.layer.borderColor = Constant.Colors.AccentColor.cgColor
        container.layer.cornerRadius = 4
        container.clipsToBounds = true
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        
        // Value Label
        let valueLabel = UILabel()
        valueLabel.attributedText = formattedValueText(for: value) // Use attributed text here
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 1 // Ensure it doesn't wrap
        
        // Vertical Stack for title and value
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        
        // Add the stack view to the container
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24), // Add some padding
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -8)
        ])
        
        return container
    }
    
    private func formattedValueText(for value: String) -> NSAttributedString {
        // Split the value into two parts: the main number and the smaller part
        let parts = value.split(separator: ".", maxSplits: 1, omittingEmptySubsequences: false)
        
        // Define fonts
        let largeFont = UIFont.systemFont(ofSize: 50, weight: .bold)
        let smallFont = UIFont.systemFont(ofSize: 25, weight: .bold)
        
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
