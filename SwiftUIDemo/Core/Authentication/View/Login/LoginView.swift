//
////  LoginView.swift
////  swiftUI-practice
////
////  Created by Nikhil Mallik on 28/09/23.
//
//
//import SwiftUI
//
//struct loginView: View {
//
//    @State private var email = ""
//    @State private var password = ""
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    @State private var isLogged = false
//    @State private var showPassword = false
//    @EnvironmentObject var viewModel: AuthViewModel
//
//
//    var body: some View {
//        VStack {
//            Text("Login")
//                .font(.largeTitle)
//                .padding(.bottom, 30)
//            HStack {
//                Text("email")
//                    .padding(.bottom, 20)
//                TextField("email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 20)
//            }
//
//            HStack {
//                Text("password")
//                    .padding(.bottom, 20)
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 20)
//            }
//
//
//            Button(action: {
//                // Perform validation here
//              if self.email.isEmpty {
//                    self.alertMessage = "Please enter the email"
//                }else if self.email.isValidEmail() {
//                    self.alertMessage = "Please enter the email"
//                }
//                else if self.password.isEmpty {
//                    self.alertMessage = "Please enter the password"
//                }
//                else if (self.password.isValidPassword() != nil) {
//                    self.alertMessage = "Password must have at least 6 characters, including uppercase, lowercase, number, and special character"
//                }
//                else {
//                Task {
//                    await viewModel.signIn(withEmail: email, password: password)
//                }
//
//                    self.alertMessage = "Invalid credentials. Please try again."
//                }
//                self.showAlert = true
//                
//
//            }) {
//                Text("Login")
//                    .font(.headline)
//                    .padding()
//                    .background(Color.black)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Login Status"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
//            }
//
//        }
//        .padding()
//
//    }
//
//   
//}
//
//#Preview {
//    loginView()
//}
