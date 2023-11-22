//
//  LoginViewModel.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 28/09/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                self.isLoggedIn = true
            }
        }
    }
}
