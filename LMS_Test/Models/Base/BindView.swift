//
//  BindView.swift
//  LMS_Test
//
//  Created by russel on 25/1/25.
//

import UIKit

class BindView<ViewModel>: UIView {
    let viewModel: ViewModel
    
    init(with viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: UIScreen.main.bounds)
        
        runFlow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func runFlow() {
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {}
    func setupLayouts() {}
}
