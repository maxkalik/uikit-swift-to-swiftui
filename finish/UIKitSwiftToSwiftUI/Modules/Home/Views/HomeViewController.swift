//
//  ViewController.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/19/22.
//

import UIKit

final class HomeViewController: BaseViewController {

    private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.viewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        viewModel.getData()
    }

    private func setupViews() {
        view.addSubview(signInButton)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            // Sign In button
            signInButton.widthAnchor.constraint(equalToConstant: 150),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            // Title Label
            titleLabel.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -30)
        ])
    }
    
    @objc
    private func signInTapped() {
        viewModel.signInTap()
    }
}

// MARK: - HomeViewModelViewDelegate

extension HomeViewController: HomeViewModelViewDelegate {
    func viewModelTitlesDidUpdate(_ viewModel: HomeViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.titleLabel.text = viewModel.title
            self.signInButton.setTitle(viewModel.buttonTitle, for: .normal)
        }
    }
    
    func viewModelStartLoading(_ viewModel: HomeViewModel) {
        startActivityIndicator()
    }
    
    func viewModelStopLoading(_ viewModel: HomeViewModel) {
        stopActivityIndicator()
    }
}
