//
//  BaseController.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import UIKit

protocol BaseController: AnyObject {
    var view: UIView! { get set }
    var progressView: ProgressView { get set }

    func startActivityIndicator()
    func stopActivityIndicator()
}

extension BaseController {
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


