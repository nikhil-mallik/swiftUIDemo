//
//  ProfileSummary.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 28/09/23.
//

import SwiftUI


struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var viewModel: AuthViewModel
    var profile: UserProfile
    
    var body: some View {
//        if let user = viewModel.currentUser {
            ScrollView {
                VStack(alignment: .leading) {
                        Section {
                            HStack(spacing: 4) {
                                Text(UserProfile.MOCK_USER.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.white))
                                    .frame(width: 72, height: 72)
                                    .background(Color(.systemGray))
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4 ) {
                                    Text(UserProfile.MOCK_USER.fullname)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.top, 4)
                                    Text(UserProfile.MOCK_USER.email)
                                        .font(.footnote)
                                        .foregroundStyle(Color(.gray))
                                }
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
                            viewModel.signOut()
                        } label: {
                            SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                        }
                    }
                    
                    
                }
                .padding(.horizontal)
            }
//        }
        
    }
}

#Preview {
    ProfileSummary(profile: UserProfile.MOCK_USER)
        .environmentObject(ModelData())
}

