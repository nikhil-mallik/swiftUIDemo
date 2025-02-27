//
//  CategoryHome.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 28/09/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
//            .navigationTitle("Featured")
            .ignoresSafeArea(edges: .top)
            .padding(.top, 5)
            
//            .toolbar {
//                Button {
//                    showingProfile.toggle()
//                } label: {
//                    Label("User Profile", systemImage: "person.crop.circle")
//                }
//            }
//            .sheet(isPresented: $showingProfile) {
//                ProfileUIView(profile: UserProfile.MOCK_USER)
//                    
//            }
//            .transition(.slide)
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(ModelData())
}

