//
//  ProViews.swift
//  LMS_Test
//
//  Created by russel on 26/1/25.
//

import UIKit

class ProView: BindView<ProViewModel> {
    private(set) lazy var proLabel: UILabel = {
        let label = UILabel()
        label.text = "Pro"
        label.textColor = .black
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        addSubview(proLabel)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            proLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            proLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            proLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
