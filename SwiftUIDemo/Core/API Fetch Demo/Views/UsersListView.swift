//
//  UsersListView.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var vm = UsersListViewModel(forPreview: true)
    var body: some View {
        List {
            ForEach(vm.usersAndPost) { userAndPosts in
                NavigationLink {
                    PostListView(posts: userAndPosts.posts)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(userAndPosts.user.name)
                                .font(.title)
                            Spacer()
                            Text("(\(userAndPosts.numberOfPosts))")
                        }
                        Text(userAndPosts.user.email)
                    }
                }
            }
        }
        .overlay(content: {
            if vm.isLoading {
                ProgressView()
            }
        })
        .alert(alertErrorTitle, isPresented: $vm.showAlert, actions: {
            Button(okButton) {}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
        })
        .navigationTitle("Users")
        .listStyle(.plain)
        .task {
            await vm.fetchUsers()
        }
        
    }
}

#Preview {
    NavigationView {
        UsersListView()
    }
}
