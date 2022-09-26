//
//  BaseViewController.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var progressView = ProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCommon()
    }
    
    private func setupCommon() {
        view.backgroundColor = .orange
    }
}

extension BaseViewController {
    func startActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(self.progressView)
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.progressView.removeFromSuperview()
        }
    }
}


