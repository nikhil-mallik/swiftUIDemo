//
//  Dashboard.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 28/09/23.
//

import SwiftUI

struct Dashboard: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    private var selectedTabLabel: String {
        switch selection {
        case .featured:
            return featuredTitle
        case .list:
            return landmarkTitle
        }
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                CategoryHome()
                    .tabItem {
                        Label(featuredTitle, systemImage: starIcon)
                    }
                    .tag(Tab.featured)
                
                
                LandmarkList()
                    .tabItem {
                        Label(listLabel, systemImage: listBulletIcon)
                    }
                    .tag(Tab.list)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ProfileUIView(profile: UserProfile.MOCK_USER)
                    } label: {
                        Label(userProfileLabel, systemImage: personCircleIcon)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    // Display the label of the selected tab
                    Text(selectedTabLabel)
                        .bold()
                        .font(.title)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
        
        
    }
}

#Preview {
    Dashboard()
        .environmentObject(ModelData())
}
