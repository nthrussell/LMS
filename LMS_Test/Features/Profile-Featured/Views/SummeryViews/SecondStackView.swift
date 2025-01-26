//
//  SecondStackView.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class SecondStackView : BindView<FeaturedViewModel> {
    
    private(set) lazy var box1: UIView = {
        let view = createBox(title: "City Rank:", value: " 01")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var box2: UIView = {
        let view = createBox(title: "National Rank:", value: " 01")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var box3: UIView = {
        let view = createBox(title: "World Rank:", value: " 01")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var box4: UIView = {
        let view = createBox(title: "Form:", value: " W W L L W")
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
        container.layer.cornerRadius = 4
        container.clipsToBounds = true
        container.backgroundColor = Constant.Colors.AccentColor // Set green background

        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .white // Set white text color
        titleLabel.textAlignment = .left

        // Value Label
        let valueLabel = UILabel()
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 1 // Ensure single-line display

        // Handle "box4" value formatting
        if title == "Form:" {
            valueLabel.attributedText = formattedFormText(for: value)
        } else {
            valueLabel.text = value
            valueLabel.font = .systemFont(ofSize: 16, weight: .bold) // Bold font for value
            valueLabel.textColor = .white // Set white text color
        }

        // Horizontal Stack for title and value
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 0

        // Add the stack view to the container
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16), // Add padding
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
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
                color = Constant.Colors.deepGreenColor // Green for "W"
            } else if word == "L" {
                color = .red // Red for "L"
            } else {
                color = .white // Default white
            }

            let wordAttributedString = NSAttributedString(string: "\(word) ", attributes: [
                .foregroundColor: color,
                .font: font
            ])
            attributedString.append(wordAttributedString)
        }

        return attributedString
    }
    
}
