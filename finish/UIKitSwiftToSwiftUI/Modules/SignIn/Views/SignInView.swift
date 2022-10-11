//
//  SignInView.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/21/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                EmptyView()
            } else {
                Text(viewModel.title)
                TextField(
                    viewModel.textFieldPlaceholder,
                    text: $viewModel.name)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                Button {
                    viewModel.buttonTapped()
                } label: {
                    Text(viewModel.buttonTitle)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding()
                }
                .background(Color.black)
                .cornerRadius(10)
                .padding(.top, 20)
            }
        }
        .alert(viewModel.errorAlertTitle, isPresented: $viewModel.shouldShowAlert) {
            Button(viewModel.errorAlertButtonTitle) {
                viewModel.errorAlertButtonTapped()
            }
        }
    }
}
