//
//  DescAndHonsView.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import UIKit

class DescAndHonsView: BindView<FeaturedViewModel> {
    
    // MARK: - DesContainer
    private let desContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 0.5
        view.layer.borderColor = Constant.Colors.AccentColor.cgColor
        return view
    }()
    
    private let desTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Constant.Colors.AccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let desDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the description text. It contains some regular font content. This is the description text. It contains some regular font content. This is the description text. It contains some regular font content. This is the description text. It contains some regular font content."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Constant.Colors.desTextColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - HonsContainer
    private let honsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 0.5
        view.layer.borderColor = Constant.Colors.AccentColor.cgColor
        return view
    }()
    
    private let honsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Honours and Awards"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Constant.Colors.AccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let row1TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Champions"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = Constant.Colors.textDeepGreenColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let row1ValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.Fonts.ptSansRegular, size: 14)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let row1Separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = Constant.Colors.AccentColor.withAlphaComponent(0.4)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let row2TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Runners Up"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = Constant.Colors.textDeepGreenColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let row2ValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.Fonts.ptSansRegular, size: 14)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let row2Separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = Constant.Colors.AccentColor.withAlphaComponent(0.4)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "view_all_honours")
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 2
        button.layer.borderColor = Constant.Colors.buttonRed.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Setup View
    override func setupViews() {
        addSubview(desContainer)
        addSubview(honsContainer)
        
        // Add elements to DesContainer
        desContainer.addSubview(desTitleLabel)
        desContainer.addSubview(desDescriptionLabel)
        
        // Add elements to HonsContainer
        honsContainer.addSubview(honsTitleLabel)
        honsContainer.addSubview(row1TitleLabel)
        honsContainer.addSubview(row1ValueLabel)
        honsContainer.addSubview(row1Separator)
        honsContainer.addSubview(row2TitleLabel)
        honsContainer.addSubview(row2ValueLabel)
        honsContainer.addSubview(row2Separator)
        honsContainer.addSubview(viewAllButton)
        
    }
    
    // MARK: - Constraints
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            // DesContainer
            desContainer.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            desContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            desContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            desTitleLabel.topAnchor.constraint(equalTo: desContainer.topAnchor, constant: 16),
            desTitleLabel.leadingAnchor.constraint(equalTo: desContainer.leadingAnchor, constant: 16),
            desTitleLabel.trailingAnchor.constraint(equalTo: desContainer.trailingAnchor, constant: -16),
            
            desDescriptionLabel.topAnchor.constraint(equalTo: desTitleLabel.bottomAnchor, constant: 8),
            desDescriptionLabel.leadingAnchor.constraint(equalTo: desContainer.leadingAnchor, constant: 16),
            desDescriptionLabel.trailingAnchor.constraint(equalTo: desContainer.trailingAnchor, constant: -16),
            desDescriptionLabel.bottomAnchor.constraint(equalTo: desContainer.bottomAnchor, constant: -16),
            
            // HonsContainer
            honsContainer.topAnchor.constraint(equalTo: desContainer.bottomAnchor, constant: 10),
            honsContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            honsContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            honsTitleLabel.topAnchor.constraint(equalTo: honsContainer.topAnchor, constant: 16),
            honsTitleLabel.leadingAnchor.constraint(equalTo: honsContainer.leadingAnchor, constant: 16),
            honsTitleLabel.trailingAnchor.constraint(equalTo: honsContainer.trailingAnchor, constant: -16),
            
            // Row 1
            row1TitleLabel.topAnchor.constraint(equalTo: honsTitleLabel.bottomAnchor, constant: 16),
            row1TitleLabel.leadingAnchor.constraint(equalTo: honsContainer.leadingAnchor, constant: 16),
            row1ValueLabel.topAnchor.constraint(equalTo: row1TitleLabel.topAnchor),
            row1ValueLabel.trailingAnchor.constraint(equalTo: honsContainer.trailingAnchor, constant: -16),
            row1Separator.topAnchor.constraint(equalTo: row1TitleLabel.bottomAnchor, constant: 8),
            row1Separator.leadingAnchor.constraint(equalTo: honsContainer.leadingAnchor, constant: 8),
            row1Separator.trailingAnchor.constraint(equalTo: honsContainer.trailingAnchor, constant: -8),
            row1Separator.heightAnchor.constraint(equalToConstant: 1),
            
            // Row 2
            row2TitleLabel.topAnchor.constraint(equalTo: row1Separator.bottomAnchor, constant: 8),
            row2TitleLabel.leadingAnchor.constraint(equalTo: honsContainer.leadingAnchor, constant: 16),
            row2ValueLabel.topAnchor.constraint(equalTo: row2TitleLabel.topAnchor),
            row2ValueLabel.trailingAnchor.constraint(equalTo: honsContainer.trailingAnchor, constant: -16),
            row2Separator.topAnchor.constraint(equalTo: row2TitleLabel.bottomAnchor, constant: 8),
            row2Separator.leadingAnchor.constraint(equalTo: honsContainer.leadingAnchor, constant: 8),
            row2Separator.trailingAnchor.constraint(equalTo: honsContainer.trailingAnchor, constant: -8),
            row2Separator.heightAnchor.constraint(equalToConstant: 1),
            
            // View All Button
            viewAllButton.topAnchor.constraint(equalTo: row2Separator.bottomAnchor, constant: 16),
            viewAllButton.leadingAnchor.constraint(equalTo: honsContainer.leadingAnchor, constant: 8),
            viewAllButton.trailingAnchor.constraint(equalTo: honsContainer.trailingAnchor, constant: -8),
            viewAllButton.heightAnchor.constraint(equalToConstant: 40),
            viewAllButton.bottomAnchor.constraint(equalTo: honsContainer.bottomAnchor, constant: -16)
        ])
    }
    
    func updateUI(with desc:TeamDescription, and hons: HonourAndAward) {
        desDescriptionLabel.text = desc.teamDescription
        row1ValueLabel.text = "\(hons.champion)"
        row2ValueLabel.text = "\(hons.runnersUp)"
    }
}
