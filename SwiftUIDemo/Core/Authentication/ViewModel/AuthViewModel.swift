//
//  AuthViewModel.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftData

@MainActor
class AuthViewModel: ObservableObject {
    @Environment(\.modelContext) private var context
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var errorMessage: String?
    @Published var currentUserId: String?
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.currentUserId = Auth.auth().currentUser?.uid
        Task {
            await fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            self.currentUserId = result.user.uid
            await fetchUser()
        } catch {
            errorMessage = "\(loginFailed) \n\(error.localizedDescription)"
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, confirmpassword: String) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            self.currentUserId = result.user.uid
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("Users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            errorMessage = "\(createUserFailed) \n\(error.localizedDescription)"
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            errorMessage = "\(signOutFailed) \n\(error.localizedDescription)"
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("Users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
}
