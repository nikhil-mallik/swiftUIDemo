//
//  SignUpUI.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 06/11/23.
//

import SwiftUI

struct SignUpUI: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @State private var fullname = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isNotSecure = false
    @State private var isPasswordSecure = true
    @State private var isConfirmPasswordSecure = true
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
   
    var body: some View {
        VStack {
            // image
            Image("login")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 120)
                .padding(.vertical, 32)
            
            // form fields
            VStack(spacing:24) {
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your name",
                          isSecureField: $isNotSecure,
                          showEyeButton: false)
                .autocorrectionDisabled(true)
                
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
                          isSecureField: $isPasswordSecure,
                          showEyeButton: true)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                
                InputView(text: $confirmpassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField: $isConfirmPasswordSecure,
                          showEyeButton: true)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                
                
            }
            .padding(.top, 12)
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        // sign in button
        Button {
            if validateInputs(fullname: fullname, email: email, password: password, confirmpassword: confirmpassword, viewModel: viewModel, alertMessage: &alertMessage, showAlert: &showAlert) {
                Task {
                    await viewModel.createUser(withEmail: email, password: password, fullname: fullname, confirmpassword: confirmpassword)
                    self.showAlert = true
                }
            }
        } label: {
            HStack {
                Text("SIGN UP")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .modifier(AlertModifier(isShowingAlert: $showAlert, title: "Alert", message: self.alertMessage, primaryButtonTitle: "OK", secondaryButtonTitle: nil, primaryAction: { self.showAlert = false }, secondaryAction: nil))
        .background(Color(.black))
        .cornerRadius(10)
        .padding(.top, 24)
        
        Spacer()
        
        // sign up button
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .foregroundColor(.black)
            .font(.system(size: 14))
        }
    }
}

#Preview {
    SignUpUI()
}
