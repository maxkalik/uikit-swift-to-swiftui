//
//  AppCoordinator.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private(set) var navigationController: UINavigationController
    private lazy var dependency: Dependency = AppDependency()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModelImplementation(dependency: dependency)
        viewModel.coordinatorDelegate = self
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSignIn() {
        let viewModel = SignInViewModel(dependency: dependency)
        viewModel.coordinatorDelegate = self
        
        // show swiftui view
    }
}

// MARK: - HomeViewModelCoordinatorDelegate

extension AppCoordinator: HomeViewModelCoordinatorDelegate {
    func viewModelSignInDidTap(_ viewModel: HomeViewModel) {
        showSignIn()
    }
}

// MARK: - HomeViewModelCoordinatorDelegate

extension AppCoordinator: SignInViewModelCoordinatorDelegate {
    func viewModelDidFinish(_ viewModel: SignInViewModel) {
        navigationController.popViewController(animated: true)
    }
}
