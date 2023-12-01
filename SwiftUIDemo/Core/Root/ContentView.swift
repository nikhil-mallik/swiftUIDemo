//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var modelData = ModelData()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                Dashboard()
                    .environmentObject(modelData)
            } else {
                LoginUI()
            }
        }
        .onAppear {
            UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        }
       
    }
}

#Preview {
    ContentView()
}
