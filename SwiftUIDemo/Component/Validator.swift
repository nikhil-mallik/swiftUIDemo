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

extension String {
    func isValidEmail() -> String? {
        // This is a basic email validation regex pattern.
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValid = emailTest.evaluate(with: self)
        if isValid {
            return nil // email is valid
        } else {
            return ""
        }
        
    }
    
    func isValidPassword() -> String? {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$"
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValid = passwordTest.evaluate(with: self)
        
        if isValid {
            return nil // Password is valid
        } else {
            return "Password must have at least 6 characters, including uppercase, lowercase, number, and special character"
        }
    }
    
    func isValidFullName() -> String? {
        let fullNameRegex = "^[a-zA-Z]+(?:\\s+[a-zA-Z]+)*$"
        
        let fullNameTest = NSPredicate(format: "SELF MATCHES %@", fullNameRegex)
        let isValid = fullNameTest.evaluate(with: self)
        
        if isValid {
            return nil // Full name is valid
        } else {
            return "Name not in valid format "
        }
    }
}
