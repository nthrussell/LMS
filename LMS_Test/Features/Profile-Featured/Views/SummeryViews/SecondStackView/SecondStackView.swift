//
//  SecondStackView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class SecondStackView : BindView<FeaturedViewModel> {
    
    private(set) lazy var box1: UIView = {
        let view = createBox(title: "City Rank:", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "secondBox1"
        return view
    }()
    
    private(set) lazy var box2: UIView = {
        let view = createBox(title: "National Rank:", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "secondBox2"
        return view
    }()
    
    private(set) lazy var box3: UIView = {
        let view = createBox(title: "World Rank:", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "secondBox3"
        return view
    }()
    
    private(set) lazy var box4: UIView = {
        let view = createBox(title: "Form:", value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "secondBox4"
        return view
    }()
    
    private(set) lazy var row1: UIStackView = {
        let row1 = UIStackView(arrangedSubviews: [box1, box2])
        row1.axis = .horizontal
        row1.alignment = .fill
        row1.distribution = .fillEqually
        row1.translatesAutoresizingMaskIntoConstraints = false
        row1.spacing = 16
        row1.accessibilityIdentifier = "secondRow1"
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
        row2.accessibilityIdentifier = "secondRow2"
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
        mainStackView.accessibilityIdentifier = "secondStackView"
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
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "secondStack_BG")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.cornerRadius = 4
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.clipsToBounds = true
        
        let container = UIView()
        container.layer.cornerRadius = 4
        container.clipsToBounds = true
        container.backgroundColor = Constant.Colors.AccentColor // Set background color
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        // Explicit height constraint for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 20) // Fixed height
        ])
        
        // Value Label
        let valueLabel = UILabel()
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 1
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        valueLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        // Handle "Form:" value formatting
        if title == "Form:" {
            valueLabel.attributedText = formattedFormText(for: value)
        } else {
            valueLabel.text = value
            valueLabel.font = .systemFont(ofSize: 16, weight: .bold)
            valueLabel.textColor = .white
        }
        
        // Explicit height constraint for valueLabel
        NSLayoutConstraint.activate([
            valueLabel.heightAnchor.constraint(equalToConstant: 20) // Fixed height
        ])
        
        // Horizontal Stack for title and value
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill // Changed to fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add stack view to container
        container.addSubview(backgroundImageView)
        container.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: container.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        return container
    }
    private func formattedFormText(for value: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let words = value.split(separator: " ")
        for word in words {
            let color: UIColor
            let font: UIFont = .systemFont(ofSize: 16, weight: .bold)
            
            if word == "W" {
                color = Constant.Colors.SegmentColor // Green for "W"
            } else if word == "L" {
                color = .red // Red for "L"
            } else {
                color = .white // Default white
            }
            
            let wordAttributedString = NSAttributedString(string: " \(word)", attributes: [
                .foregroundColor: color,
                .font: font
            ])
            attributedString.append(wordAttributedString)
        }
        
        return attributedString
    }
    
    func updateUI(with secondStack: SecondStack) {
        // Update City Rank box
        let cityRankValue = String(format: " %02d", secondStack.regionalRank)
        if let cityRankLabel = box1.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            cityRankLabel.text = cityRankValue
        }
        
        // Update National Rank box
        let nationalRankValue = String(format: " %02d", secondStack.countryRank)
        if let nationalRankLabel = box2.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            nationalRankLabel.text = nationalRankValue
        }
        
        // Update World Rank box
        let worldRankValue = String(format: " %02d", secondStack.worldRank)
        if let worldRankLabel = box3.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            worldRankLabel.text = worldRankValue
        }
        
        // Update Form box
        if let formLabel = box4.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UILabel {
            formLabel.attributedText = formattedFormText(for: secondStack.form)
        }
    }
}
