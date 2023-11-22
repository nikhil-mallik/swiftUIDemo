////
////  SignUpScreen.swift
////  swiftUI-practice
////
////  Created by Nikhil Mallik on 28/09/23.
////
//
//import SwiftUI
//
//struct SignUpScreen: View {
//    @StateObject private var modelData = ModelData()
//    @State private var username = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var confirmPassword = ""
//    @State private var alertMessage = ""
//    @State private var birthDate = Date()
//    @State private var age: DateComponents = DateComponents()
//    @State private var isEditing = false
//    @State private var showPassword = false
//    @State private var showPassword2 = false
//    @State private var showAlert = false
//    @State private var selection = "Male"
//    @State private var isActive: Bool = false
//    
//    let gender = ["Male", "Female", "Transgender"]
//    
//    @ViewBuilder
//    var body: some View {
//        NavigationView(content: {
//            ScrollView {
//                VStack {
//                    Text("Registration")
//                        .foregroundColor(Color.black)
//                        .font(Font.custom("Permanent Marker", size: 36))
//                        .padding()
//                    Group {
//                        HStack {
//                            Text("Name")
//                                .font(Font.custom("Permanent Marker", size: 18))
//                                .padding(.top, 10)
//                            Spacer()
//                        }
//                        TextField("Enter name", text:  $username) {
//                            isEditing in self.isEditing = isEditing
//                        }
//                        .textInputAutocapitalization(.none)
//                        .autocorrectionDisabled(true)
//                        .keyboardType(.emailAddress)
//                        .padding(.top, 5)
//                        Divider()
//                            .foregroundColor(.black)
//                    }
//                    Group {
//                        HStack {
//                            Text("Email")
//                                .font(Font.custom("Permanent Marker", size: 18))
//                                .padding(.top, 10)
//                            Spacer()
//                        }
//                        TextField("Enter Email", text:  $email) {
//                            isEditing in self.isEditing = isEditing
//                        }
//                        .textInputAutocapitalization(.none)
//                        .autocorrectionDisabled(true)
//                        .keyboardType(.emailAddress)
//                        .padding(.top, 5)
//                        Divider()
//                            .foregroundColor(.black)
//                    }
//                    Group {
//                        HStack {
//                            Text("Password")
//                                .font(Font.custom("Permanent Marker", size: 18))
//                                .padding(.top, 10)
//                            Spacer()
//                        }
//                        ZStack {
//                            if showPassword {
//                                TextField("Enter Password", text: $password)
//                            }
//                            else {
//                                SecureField("Enter Password", text: $password)
//                            }
//                        }
//                        .frame(height: 20)
//                        .textInputAutocapitalization(.none)
//                        .overlay(Image(systemName: showPassword ? "eye.slash" : "eye").onTapGesture {
//                            showPassword.toggle()
//                        }, alignment: .trailing)
//                        .autocorrectionDisabled(true)
//                        .padding(.top, 5)
//                        Divider()
//                            .foregroundColor(.black)
//                    }
//                    Group {
//                        HStack {
//                            Text("Confirm Password")
//                                .font(Font.custom("Permanent Marker", size: 18))
//                                .padding(.top, 10)
//                            Spacer()
//                        }
//                        ZStack {
//                            if showPassword {
//                                TextField("Re-enter Password", text: $confirmPassword)
//                            }
//                            else {
//                                SecureField("Re-enter Password", text: $confirmPassword)
//                            }
//                        }
//                        .frame(height: 20)
//                        .textInputAutocapitalization(.none)
//                        .overlay(Image(systemName: showPassword2 ? "eye.slash" : "eye").onTapGesture {
//                            showPassword2.toggle()
//                        }, alignment: .trailing)
//                        .autocorrectionDisabled(true)
//                        .padding(.top, 5)
//                        Divider()
//                            .foregroundColor(.black)
//                    }
////                    Group {
////                        VStack(alignment: .center) {
////                            DatePicker("Birth date:", selection: $birthDate, in: ...Date(), displayedComponents: .date).datePickerStyle(.automatic)
////                                .onChange(of: birthDate, perform: {
////                                    value in
////                                    age = Calendar.current.dateComponents([.year, .month, .day], from: birthDate, to: Date())
////                                })
////                            Text("Age -> \(age.year ?? 0) years")
////                        }
////                    }
////                    Group {
////                        HStack {
////                            Text("Gender:")
////                            Picker("Select gender", selection: $selection) {
////                                ForEach(gender, id: \.self) {
////                                    Text($0)
////                                }
////                            }
////                            .pickerStyle(.automatic)
////                            Spacer()
////                        }
////                    }
//                    
//                    Spacer()
//                        .frame(height: 40)
//                    Group {
//                        NavigationLink(
//                            destination: Dashboard()
//                                .environmentObject(modelData),
//                            isActive: $isActive,
//                            label: { EmptyView() }
//                        
//                        )
//                        Button (action: {
//                            guard username.isEmpty == false && email.isEmpty == true && password.isEmpty == true && confirmPassword.isEmpty == true else { return }
//                            print("Checking")
//                            print("Sign Up Tapped")
//                           isActive = true
//                        }, label: {
//                            Text("Sign Up")
//                        } )
//                        .foregroundColor(.white)
//                        .font(Font.custom("Permanent Marker", size: 18))
//                        .padding(.horizontal, 20)
//                        .padding()
//                        .background(Color.black)
//                        .cornerRadius(70.0)
//                        Text("Already have an account ?")
//                            .padding(.top, 10)
//                        NavigationLink("Login", destination: LoginScreen())
//                        
//                    }
//                    
//                }
//                .padding(.horizontal,20)
//                .ignoresSafeArea()
//            }
//            
//            
//        })
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//#Preview {
//    SignUpScreen()
//}
