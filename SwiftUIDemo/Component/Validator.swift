//
//  Validator.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 08/11/23.
//

import Foundation


@MainActor func validateInputs(
    fullname: String?, email: String, password: String, confirmpassword: String?,
    viewModel: AuthViewModel , alertMessage: inout String, showAlert: inout Bool) -> Bool {
        if let fullname = fullname, fullname.isEmpty {
            alertMessage = emptyFullName
        } else if let fullname = fullname, (fullname.isValidFullName() != nil) {
            alertMessage = notValidFullName
        } else if email.isEmpty {
            alertMessage = emptyEmail
        } else if (email.isValidEmail() != nil) {
            alertMessage = notValidEmail
        } else if password.isEmpty {
            alertMessage = emptyPassword
        } else if (password.isValidPassword() != nil) {
            alertMessage = notValidPassword
        } else if let confirmpassword = confirmpassword, confirmpassword.isEmpty {
            alertMessage = emptyConfirmPassword
        } else if let confirmpassword = confirmpassword, password != confirmpassword {
            alertMessage = passwordNotMatch
        } else if let error = viewModel.errorMessage {
            alertMessage = error
        } else {
            return true
        }
        
        showAlert = true
        return false
    }
