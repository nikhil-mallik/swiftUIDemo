////
////  ProfileHost.swift
////  swiftUI-practice
////
////  Created by Nikhil Mallik on 28/09/23.
////
//
//import SwiftUI
//
//struct ProfileHost: View {
//    @Environment(\.editMode) var editMode
//    @EnvironmentObject var modelData: ModelData
//    @State private var draftProfile = UserProfile.MOCK_USER
//    
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                if editMode?.wrappedValue == .active {
//                    Button(cancelButton, role: .cancel) {
//                        draftProfile = modelData.profile
//                        editMode?.animation().wrappedValue = .inactive
//                    }
//                }
//                Spacer()
//                EditButton()
//            }
//            
//            if editMode?.wrappedValue == .inactive {
//                ProfileSummary(profile: modelData.profile)
//            } else {
//                ProfileEditor(profile: $draftProfile)
//                    .onAppear {
//                        draftProfile = modelData.profile
//                    }
//                    .onDisappear {
//                        modelData.profile = draftProfile
//                    }
//            }
//        }
//        .padding(.horizontal)
//    }
//}
//
//#Preview {
//    ProfileHost()
//        .environmentObject(ModelData())
//}
