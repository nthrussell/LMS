//
//  UpcomingResultsCell.swift
//  LMS_Test
//
//  Created by russel on 29/1/25.
//

import UIKit
import Kingfisher

class UpcomingResultsCell: UITableViewCell {
    static let identifier = "UpcomingResultsCell"
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Saturday 05 October"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.textColor = Constant.Colors.desTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sideAImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sideATitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Team A"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sideBImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sideBTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Team B"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = Constant.Colors.AccentColor.withAlphaComponent(0.4)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Team A won"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = Constant.Colors.AccentColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator: UIView = {
           let separator = UIView()
           separator.backgroundColor = Constant.Colors.AccentColor.withAlphaComponent(0.5)
           separator.translatesAutoresizingMaskIntoConstraints = false
           return separator
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = Constant.Colors.AccentColor.cgColor
        contentView.addSubview(dateLabel)
        contentView.addSubview(sideAImageView)
        contentView.addSubview(sideATitleLabel)
        contentView.addSubview(sideBImageView)
        contentView.addSubview(sideBTitleLabel)
        contentView.addSubview(vsLabel)
        contentView.addSubview(resultLabel)
        contentView.addSubview(separator)

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Date Label
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // VS Label
            vsLabel.centerYAnchor.constraint(equalTo: sideAImageView.centerYAnchor),
            vsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Side A
            sideAImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            sideAImageView.trailingAnchor.constraint(equalTo: vsLabel.leadingAnchor, constant: -24),
            sideAImageView.widthAnchor.constraint(equalToConstant: 40),
            sideAImageView.heightAnchor.constraint(equalToConstant: 40),
            
            sideATitleLabel.topAnchor.constraint(equalTo: sideAImageView.bottomAnchor, constant: 4),
            sideATitleLabel.trailingAnchor.constraint(equalTo: sideAImageView.trailingAnchor),
            
            // Side B
            sideBImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            sideBImageView.leadingAnchor.constraint(equalTo: vsLabel.trailingAnchor, constant: 24),
            sideBImageView.widthAnchor.constraint(equalToConstant: 40),
            sideBImageView.heightAnchor.constraint(equalToConstant: 40),
            
            sideBTitleLabel.topAnchor.constraint(equalTo: sideBImageView.bottomAnchor, constant: 4),
            sideBTitleLabel.leadingAnchor.constraint(equalTo: sideBImageView.leadingAnchor),
            
            // Result Label
            resultLabel.topAnchor.constraint(equalTo: sideATitleLabel.bottomAnchor, constant: 8),
            resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //resultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            separator.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 8),
            separator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.widthAnchor.constraint(equalTo: widthAnchor),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(date: String, sideA: String, sideAImage: String, sideB: String, sideBImage: String, result: String) {
        dateLabel.text = date
        sideAImageView.kf.setImage(with: URL(string: sideAImage))
        sideATitleLabel.text = sideA
        sideBImageView.kf.setImage(with: URL(string: sideBImage))
        sideBTitleLabel.text = sideB
        resultLabel.text = result
    }
}
