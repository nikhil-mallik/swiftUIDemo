//
//  ProfileUIView.swift
//  swiftUIPractice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import SwiftUI

struct ProfileUIView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var modelData: ModelData
    @State private var showAlert = false
    var profile: UserProfile
    
    var body: some View {
        if let user = viewModel.currentUser {
        ScrollView {
            VStack(alignment: .leading) {
                    Section {
                        HStack(spacing: 4) {
//                            Text(UserProfile.MOCK_USER.initials)
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.white))
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4 ) {
//                                Text(UserProfile.MOCK_USER.fullname)
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
//                                Text(UserProfile.MOCK_USER.email)
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundStyle(Color(.gray))
                            }
                        }
                    }
//                Divider()
//                Section {
//                    VStack(alignment: .leading, spacing: 4 ) {
//                        
//                        Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
//                        Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
//                        Text("Goal Date: ") + Text(profile.goalDate, style: .date)
//                    }
//                }
                Divider()
                Section("Completed Badges") {
                    VStack(alignment: .leading) {
                        
                        ScrollView(.horizontal) {
                            HStack {
                                HikeBadge(name: "First Hike")
                                HikeBadge(name: "Earth Day")
                                    .hueRotation(Angle(degrees: 90))
                                HikeBadge(name: "Tenth Hike")
                                    .grayscale(0.5)
                                    .hueRotation(Angle(degrees: 45))
                            }
                            .padding(.bottom)
                        }
                    }
                }
                Divider()
                
                Section("Recent Hikes") {
                    HikeView(hike: modelData.hikes[0])
                }
                Divider()
                Section("Account") {
                    Button {
                        showAlert.toggle()
                        
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    .modifier(AlertModifier(isShowingAlert: $showAlert, title: "Logout Alert", message: "Sure you want to logout ?", primaryButtonTitle: "No", secondaryButtonTitle: "Yes", primaryAction: { self.showAlert = false }, secondaryAction: {  viewModel.signOut()}))
                }
            }
            .padding()
        }
        } else {
            Section("Account") {
                Button {
                    showAlert.toggle()
                    
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                .modifier(AlertModifier(isShowingAlert: $showAlert, title: "Logout Alert", message: "Sure you want to logout ?", primaryButtonTitle: "No", secondaryButtonTitle: "Yes", primaryAction: { self.showAlert = false }, secondaryAction: {  viewModel.signOut()}))
            }
        }
    }
}

#Preview {
    ProfileUIView(profile: UserProfile.MOCK_USER)
        .environmentObject(ModelData())
}

