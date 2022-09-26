//
//  BaseViewController.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import UIKit

class BaseViewController: UIViewController, BaseController {
    
    lazy var progressView = ProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCommon()
    }
    
    private func setupCommon() {
        view.backgroundColor = .orange
    }
}
