//
//  HomeViewModel.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import Foundation

// MARK: - Delegates

protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func viewModelSignInDidTap(_ viewModel: HomeViewModel)
}

protocol HomeViewModelViewDelegate: AnyObject {
    func viewModelTitlesDidUpdate(_ viewModel: HomeViewModel)
    func viewModelStartLoading(_ viewModel: HomeViewModel)
    func viewModelStopLoading(_ viewModel: HomeViewModel)
}

// MARK: - Protocol

protocol HomeViewModel {
    
    var viewDelegate: HomeViewModelViewDelegate? { get set }
    var title: String { get }
    var buttonTitle: String { get }
    
    func getData()
    func signInTap()
}

// MARK: - Implementation

final class HomeViewModelImplementation: HomeViewModel {
    
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    var viewDelegate: HomeViewModelViewDelegate?
    
    private var dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
        self.dependency.delegate = self
    }
    
    var title: String {
        guard !dependency.name.isEmpty else { return "" }
        return "Welcome, \(dependency.name)"
    }
    
    var buttonTitle: String {
        guard !dependency.name.isEmpty else { return "Sign In" }
        return "Logout"
    }
    
    func getData() {
        viewDelegate?.viewModelStartLoading(self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.viewDelegate?.viewModelStopLoading(self)
        }
    }
    
    func signInTap() {
        coordinatorDelegate?.viewModelSignInDidTap(self)
    }
}

// MARK: - DependencyDelegate

extension HomeViewModelImplementation: DependencyDelegate {
    func appDependencyDidUpdate() {
        viewDelegate?.viewModelTitlesDidUpdate(self)
    }
}





