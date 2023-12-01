//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 08/11/23.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct SwiftUIDemoApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
        .modelContainer(for: SwiftDataUserData.self)
        
    }
}
