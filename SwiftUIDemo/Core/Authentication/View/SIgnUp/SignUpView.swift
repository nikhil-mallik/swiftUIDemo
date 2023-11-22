////
////  SignUpView.swift
////  swiftUI-practice
////
////  Created by Nikhil Mallik on 28/09/23.
////
//
//import SwiftUI
//
//struct SignUpView: View {
//    @State private var username = ""
//    @State private var useremail = ""
//    @State private var userage = ""
//    @State private var password = ""
//    @State private var usergender = ""
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    @State private var isLogged = false
//    
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Text("Registration")
//                    .font(.largeTitle)
//                    .padding(.bottom, 30)
//                HStack {
//                    Text("Name")
//                        .padding(.bottom, 20)
//                    TextField("name", text: $username)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal, 50)
//                        .padding(.bottom, 20)
//                }
//                HStack {
//                    Text("Email")
//                        .padding(.bottom, 20)
//                    TextField("email", text: $useremail)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal, 55)
//                        .padding(.bottom, 20)
//                }
//                
//                HStack {
//                    Text("Password")
//                        .padding(.bottom, 20)
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal, 20)
//                        .padding(.bottom, 20)
//                }
//                HStack {
//                    Text("Gender")
//                        .padding(.bottom, 20)
//                    TextField("gender", text: $usergender)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal, 35)
//                        .padding(.bottom, 20)
//                }
//                HStack {
//                    Text("Age")
//                        .padding(.bottom, 20)
//                    TextField("age", text: $userage)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal, 60)
//                        .padding(.bottom, 20)
//                }
//                
//                
//                Button(action: {
//                    // Perform validation here
//                    if self.isValidCredentials() {
//                        self.alertMessage = "Login successful!"
//                    }
//                    else if self.username.isEmpty {
//                        self.alertMessage = "Please enter the name"
//                    }
//                    else if self.useremail.isEmpty {
//                        self.alertMessage = "Please enter the email"
//                    }
//                    else if self.password.isEmpty {
//                        self.alertMessage = "Please enter the password"
//                    }
//                    else if self.usergender.isEmpty {
//                        self.alertMessage = "Please enter the gender"
//                    }
//                    else if self.userage.isEmpty {
//                        self.alertMessage = "Please enter the age"
//                    }
//                    
//                    else {
//                        self.alertMessage = "Invalid credentials. Please try again."
//                    }
//                    self.showAlert = true
//                }) {
//                    Text("Sign Up")
//                        .font(.headline)
//                        .padding()
//                        .background(Color.black)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .alert(isPresented: $showAlert) {
//                    Alert(title: Text("Login Status"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
//                }
//                
//                VStack {
//                    Text("Already have an account ")
//                    NavigationLink("Login", destination: LoginScreen())
//                       
//                }
//                .padding()
//            }
//        }
//       
//        .padding()
//        
//    }
//    
//    func isValidCredentials() -> Bool {
//        // Check if the email is valid
//        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
//        guard emailPredicate.evaluate(with: useremail) else {
//            self.alertMessage = "Please enter a valid email address"
//            return false
//        }
//        
//        // Check if the password meets your criteria (e.g., minimum length)
//        guard password.count >= 6 else {
//            self.alertMessage = "Password must be at least 6 characters long"
//            return false
//        }
//        
//        // Check if other fields are not empty
//        guard !username.isEmpty else {
//            self.alertMessage = "Please enter your name"
//            return false
//        }
//        
//        guard !usergender.isEmpty else {
//            self.alertMessage = "Please enter your gender"
//            return false
//        }
//        
//        guard !userage.isEmpty else {
//            self.alertMessage = "Please enter your age"
//            return false
//        }
//        
//        // If all validation checks pass, consider it a valid signup
//        return true
//    }
//    
//}
//
//#Preview {
//    SignUpView()
//}
