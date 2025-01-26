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
    
    override func setupViews() {
        addSubview(firstStackView)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            firstStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            firstStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            firstStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            firstStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
