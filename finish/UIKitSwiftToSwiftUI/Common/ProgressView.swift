//
//  ProgressView.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/21/22.
//

import UIKit

class ProgressView: UIView {
    
    private lazy var activityIndicator = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupCommon()
        setupActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let superview = self.superview {
            frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            center = superview.center
            activityIndicator.color = superview.backgroundColor
        }
    }
}

// MARK: - Setup

private extension ProgressView {
    func setupCommon() {
        layer.cornerRadius = 20
        backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    func setupActivityIndicator() {
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
