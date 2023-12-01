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

// Extension for API to decode the data

extension Bundle {
    public func decode<T: Decodable>(
        _ type: T.Type,
        from file: String,
        dateDecodingStategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys ) -> T {
        guard let url = self.url(
            forResource: file,
            withExtension: nil
        ) else {
            fatalError(
                "Failed to locate \(file) in bundle."
            )
        }
        guard let data = try? Data(
            contentsOf: url
        ) else {
            fatalError(
                "Failed to load \(file) from bundle."
            )
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStategy
        guard let decodedData = try? decoder.decode(
            T.self,
            from: data
        ) else {
            fatalError(
                "Failed to decode \(file) from bundle."
            )
        }
        return decodedData
    }
}

