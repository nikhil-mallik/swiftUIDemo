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
    @Environment(\.modelContext) var context
    @EnvironmentObject var viewModel: AuthViewModel
   
    var body: some View {
        VStack {
            // image
            Image(signupImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 120)
                .padding(.vertical, 32)
            
            // form fields
            VStack(spacing:24) {
                InputView(text: $fullname,
                          title: fullNameTitle,
                          placeholder: namePlaceholder,
                          isSecureField: $isNotSecure,
                          showEyeButton: false)
                .autocorrectionDisabled(true)
                
                InputView(text: $email,
                          title: emailTitle,
                          placeholder: emailPlaceholder,
                          isSecureField: $isNotSecure,
                          showEyeButton: false)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                
                InputView(text: $password,
                          title: passwordTitle,
                          placeholder: passwordPlaceholder,
                          isSecureField: $isPasswordSecure,
                          showEyeButton: true)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                
                InputView(text: $confirmpassword,
                          title: confirmPasswordTitle,
                          placeholder: confirmPasswordPlaceholder,
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
                    addUserData()
                    self.showAlert = true
                }
            }
        } label: {
            HStack {
                Text(signUpTitle)
                    .fontWeight(.semibold)
                Image(systemName: arrowRightIcon)
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .modifier(AlertModifier(isShowingAlert: $showAlert, title: alertTitle, message: self.alertMessage, primaryButtonTitle: okButton, secondaryButtonTitle: nil, primaryAction: { self.showAlert = false }, secondaryAction: nil))
        .background(Color(.black))
        .cornerRadius(10)
        .padding(.top, 24)
        
        Spacer()
        
        // sign up button
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text(alreadyAccountText)
                Text(signInTitle)
                    .fontWeight(.bold)
            }
            .foregroundColor(.black)
            .font(.system(size: 14))
        }
    }
    
    // storing data in swiftData
    func addUserData() {
        let userData = SwiftDataUserData(
            id: viewModel.currentUser!.id,
            prefersNotifications: true,
            seasonalPhoto: .winter,
            goalDate: Date.now,
            fullname: viewModel.currentUser!.fullname,
            email: viewModel.currentUser!.fullname
        )
        
        context.insert(userData)
    }
    
}

#Preview {
    SignUpUI()
}
