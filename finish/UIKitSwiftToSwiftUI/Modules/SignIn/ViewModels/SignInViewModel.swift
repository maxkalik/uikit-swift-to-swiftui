//
//  SignInViewModel.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/21/22.
//

import Foundation

// MARK: - Delegates

protocol SignInViewModelCoordinatorDelegate: AnyObject {
    func viewModelDidFinish(_ viewModel: SignInViewModel)
}

protocol SignInViewModelViewDelegate: AnyObject {
    func viewModelStartLoading(_ viewModel: SignInViewModel)
    func viewModelStopLoading(_ viewModel: SignInViewModel)
}

// MARK: - Implementation

final class SignInViewModel: ObservableObject {
    
    weak var coordinatorDelegate: SignInViewModelCoordinatorDelegate?
    weak var viewDelegate: SignInViewModelViewDelegate?
    
    let textFieldPlaceholder: String = "Enter your name"
    let buttonTitle: String = "Login"
    let errorAlertTitle: String = "Name field shouldn't be empty"
    let errorAlertButtonTitle: String = "Ok"
    
    @Published var title: String = ""
    @Published var isLoading: Bool = true
    @Published var shouldShowAlert: Bool = false
    @Published var name: String = "" {
        didSet(old) {
            // didSet called twice
            guard name != old else { return }
            dependency.name = name
            prepareTitle(name)
        }
    }
    
    private var dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
        prepareTitle()
    }
    
    deinit {
        print("deinit \(self)")
    }
    
    func getData() {
        viewDelegate?.viewModelStartLoading(self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.viewDelegate?.viewModelStopLoading(self)
            self.isLoading = false
        }
    }
    
    private func prepareTitle(_ name: String = "") {
        if name.isEmpty {
            title = "Hello!"
        } else {
            title = "Hello, \(name)!"
        }
    }
    
    func buttonTapped() {
        guard !name.isEmpty else {
            shouldShowAlert = true
            return
        }
        dependency.updated()
        coordinatorDelegate?.viewModelDidFinish(self)
    }
    
    func errorAlertButtonTapped() {
        shouldShowAlert = false
    }
}
