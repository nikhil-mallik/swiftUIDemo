//
//  Extension.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 30/11/23.
//

import SwiftUI

// Animation Extension
extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

// MOCK Data Extension
extension User {
    static var MOCK_USER = User(
        id: NSUUID().uuidString,
        fullname: "Nikhil",
        email: "nikhil@gmail.com"
    )
}

extension UserProfile {
    static var MOCK_USER = UserProfile(
        id: NSUUID().uuidString,
        seasonalPhoto: .winter,
        fullname: "Nikhil Mallik",
        email: "nikhil@gmail.com"
    )
}

extension SwiftDataUserData {
    static var MOCK_USER = SwiftDataUserData(
        id: NSUUID().uuidString,
        prefersNotifications: true,
        seasonalPhoto: .winter,
        goalDate: Date.now,
        fullname: "Default user",
        email: "default@gmail.com"
    )
}

// Validation Extension
extension String {
    func isValidEmail() -> String? {
        // This is a basic email validation regex pattern.
        let emailRegex = emailRegexValue
        let emailTest = NSPredicate(format: formatMatchRegex, emailRegex)
        let isValid = emailTest.evaluate(with: self)
        if isValid {
            return nil // email is valid
        } else {
            return notValidEmail
        }
    }
    
    func isValidPassword() -> String? {
        let passwordRegex = passwordRegexValue
        let passwordTest = NSPredicate(format: formatMatchRegex, passwordRegex)
        let isValid = passwordTest.evaluate(with: self)
        if isValid {
            return nil // Password is valid
        } else {
            return notValidPassword
        }
    }
    
    func isValidFullName() -> String? {
        let fullNameRegex = fullNameRegexValue
        let fullNameTest = NSPredicate(format: formatMatchRegex, fullNameRegex)
        let isValid = fullNameTest.evaluate(with: self)
        if isValid {
            return nil // Full name is valid
        } else {
            return notValidFullName
        }
    }
}
