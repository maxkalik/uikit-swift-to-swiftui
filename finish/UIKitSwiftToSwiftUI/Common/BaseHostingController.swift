//
//  BaseHostingViewController.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import UIKit
import SwiftUI

class BaseHostingController<ContentView: View>: UIHostingController<ContentView>, BaseController {
    
    lazy var progressView = ProgressView()
    
    override init(rootView: ContentView) {
        super.init(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCommon()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressView.center = view.center
    }
    
    private func setupCommon() {
        view.backgroundColor = .white
    }
    
    @objc
    required dynamic public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
