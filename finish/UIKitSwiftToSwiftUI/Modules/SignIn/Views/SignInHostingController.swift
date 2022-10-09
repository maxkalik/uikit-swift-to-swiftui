//
//  SignInHostingController.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/21/22.
//

import UIKit
import SwiftUI

final class SignInHostingController: BaseHostingController<SignInView> {

    override init(rootView: SignInView) {
        super.init(rootView: rootView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.viewModel.viewDelegate = self
    }
}

// MARK: - SignInViewModelViewDelegate

extension SignInHostingController: SignInViewModelViewDelegate {
    func viewModelStartLoading(_ viewModel: SignInViewModel) {
        startActivityIndicator()
    }
    
    func viewModelStopLoading(_ viewModel: SignInViewModel) {
        stopActivityIndicator()
    }
}
