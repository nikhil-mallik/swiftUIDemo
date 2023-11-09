//
//  LoginUI.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 06/11/23.
//

import SwiftUI

struct LoginUI: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isNotSecure = false
    @State private var isSecure = true
    @EnvironmentObject var viewModel: AuthViewModel
 
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Image("login")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 32)
                
                // form fields
                VStack(spacing:24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com",
                              isSecureField: $isNotSecure,
                              showEyeButton: false)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: $isSecure,
                             showEyeButton: true)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button {
                    if validateInputs(fullname: nil, email: email, password: password, confirmpassword: nil, viewModel: viewModel, alertMessage: &alertMessage, showAlert: &showAlert) {
                        Task {
                            await viewModel.signIn(withEmail: email, password: password)
                            self.showAlert = true
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.black))
                .cornerRadius(10)
                .padding(.top, 24)
                .modifier(AlertModifier(isShowingAlert: $showAlert, title: "Alert", message: self.alertMessage, primaryButtonTitle: "OK", secondaryButtonTitle: nil, primaryAction: { self.showAlert = false }, secondaryAction: nil))
                
                Spacer()
                
                // sign up button
                NavigationLink {
                    SignUpUI()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginUI()
}
