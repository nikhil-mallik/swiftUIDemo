//
//  ProfileUIView.swift
//  swiftUIPractice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import SwiftUI
import SwiftData

struct ProfileUIView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) private var dismiss
    @State private var showAlert = false
    var profile: UserProfile
    
    var body: some View {
        
        if let user = viewModel.currentUser  {
            ScrollView {
                VStack(alignment: .leading) {
                    Section {
                        HStack {
                            HStack(spacing: 4) {
                                //                                Text(userData.MOCK_USER.initials)
                                Text(user.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.white))
                                    .frame(width: 72, height: 72)
                                    .background(Color(.systemGray))
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4 ) {
                                    //                                    Text(userData.MOCK_USER.fullname)
                                    Text(user.fullname)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.top, 4)
                                    //                                    Text(userData.MOCK_USER.email)
                                    Text(user.email)
                                        .font(.footnote)
                                        .foregroundStyle(Color(.gray))
                                }
                            }
                            // Code for Navigation to Edit profile page.
                            //                            Spacer()
                            //                            NavigationLink(
                            //                                destination: ProfileUpdate(profile: profile)
                            //                            ) {
                            //                                Image(
                            //                                    systemName: "pencil"
                            //                                )
                            //                            }
                        }
                    }
                    
                    Divider()
                    
                    Section {
                        VStack(alignment: .leading, spacing: 4 ) {
                            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                        }
                    }
                    
                    Divider()
                    
                    Section(sessionCompleteBadges) {
                        VStack(alignment: .leading) {
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    HikeBadge(name: firstHike)
                                    HikeBadge(name: earthDay)
                                        .hueRotation(Angle(degrees: 90))
                                    HikeBadge(name: tenthHike)
                                        .grayscale(0.5)
                                        .hueRotation(Angle(degrees: 45))
                                }
                                .padding(.bottom)
                            }
                        }
                    }
                    
                    Divider()
                    
                    Section(sessionRecentHikes) {
                        HikeView(hike: modelData.hikes[0])
                    }
                    
                    Divider()
                    
                    Section(sessionAdditionalScreen) {
                        NavigationLink(destination: SlotSpinner()) {
                            SettingRowView(imageName: slotSpinnerIcon, title: slotSpinnerTitle, tintColor: .black)
                        }
                        .padding(.top, 1)
                        
                        NavigationLink(destination: SwiftDataDemo()) {
                            SettingRowView(imageName: swiftDataIcon, title: swiftDataDemoTitle, tintColor: .black)
                        }
                        .padding(.top, 1)
                    }
                    
                    Divider()
                    
                    Section(sessionAccount) {
                        Button {
                            showAlert.toggle()
                            
                        } label: {
                            SettingRowView(imageName: signOutIcon, title: signOutTitle, tintColor: .red)
                        }
                        .modifier(AlertModifier(isShowingAlert: $showAlert, title: logoutAlert, message: logoutMessage, primaryButtonTitle: noButton, secondaryButtonTitle: yesButton, primaryAction: { self.showAlert = false }, secondaryAction: {  viewModel.signOut()}))
                        .padding(.top, 1)
                    }
                }
                .padding()
            }
        } 
    }
}

#Preview {
    ProfileUIView(profile: UserProfile.MOCK_USER)
        .environmentObject(ModelData())
}
