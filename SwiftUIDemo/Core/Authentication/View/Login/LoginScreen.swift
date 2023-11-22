////
////  LoginScreen.swift
////  swiftUI-practice
////
////  Created by Nikhil Mallik on 28/09/23.
////
//
//import SwiftUI
//import FirebaseAuth
//
//struct LoginScreen: View {
//    
//    @StateObject private var modelData = ModelData()
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var isEditing = false
//    @State private var showPassword = false
//    @State private var radius = 300
//    @State private var isActive: Bool = false
//    private var canLogIn: Bool {
//        return !email.isEmpty && !password.isEmpty
//    }
//    
//    let loginView = LoginViewModel()
//    
//    @ViewBuilder
//    var body: some View {
//        NavigationView(content: {
//            VStack {
//                Spacer()
//                    .frame(height: 150)
//                Text("Login")
//                    .foregroundColor(Color.black)
//                    .font(Font.custom("Permanent Marker", size: 36))
//                    .padding()
//                Group {
//                    HStack {
//                        Text("Email")
//                            .font(Font.custom("Permanent Marker", size: 18))
//                            .padding(.top, 10)
//                        Spacer()
//                    }
//                    TextField("Email", text:  $email) {
//                        isEditing in self.isEditing = isEditing
//                    }
//                    .textInputAutocapitalization(.none)
//                    .autocorrectionDisabled(true)
//                    .keyboardType(.emailAddress)
//                    .padding(.top, 5)
//                    Divider()
//                        .foregroundColor(.black)
//                }
//                Group {
//                    HStack {
//                        Text("Password")
//                            .font(Font.custom("Permanent Marker", size: 18))
//                            .padding(.top, 10)
//                        Spacer()
//                    }
//                    ZStack {
//                        if showPassword {
//                            TextField("Password", text: $password)
//                        }
//                        else {
//                            SecureField("Password", text: $password)
//                        }
//                    }
//                    .frame(height: 20)
//                    .textInputAutocapitalization(.none)
//                    .overlay(Image(systemName: showPassword ? "eye.slash" : "eye").onTapGesture {
//                        showPassword.toggle()
//                    }, alignment: .trailing)
//                    .autocorrectionDisabled(true)
//                    .padding(.top, 5)
//                    Divider()
//                        .foregroundColor(.black)
//                }
//                Spacer()
//                    .frame(height: 50)
//                Group {
//                    NavigationLink(
//                        destination: Dashboard()
//                            .environmentObject(modelData),
//                        isActive: $isActive,
//                        label: { EmptyView() }
//                    
//                    )
//                    Button (action: {
//                        print("Login Tapped")
//                        //                        loginView.login(email: email, password: password)
//                        //                        radius = 2000
//                        isActive = true
//                    }, label: {
//                        Text("Login")
//                    } )
//                    .foregroundColor(.white)
//                    .font(Font.custom("Permanent Marker", size: 18))
//                    .padding(.horizontal, 20)
//                    .padding()
//                    .background(Color.black)
//                    .cornerRadius(70.0)
//                    //                    .disabled(!canLogIn)
//                    Text("Create a account ?")
//                        .padding(.top, 10)
//                    NavigationLink("Sign Up", destination: SignUpScreen())
//                }
//                Spacer()
//            }
//            .padding(.horizontal, 30)
//            .ignoresSafeArea()
//        })
//         .navigationBarBackButtonHidden(true)
//    }
//}
//
//#Preview {
//    LoginScreen()
//}
