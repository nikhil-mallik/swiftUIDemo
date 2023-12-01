//
//  UsersListViewModel.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import Foundation

class UsersListViewModel: ObservableObject {
    @Published var usersAndPost: [UserAndPosts] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchUsers() async {
        
        let apiUserService = APIServices(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiPostService = APIServices(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            async let users: [UserApi] = try await apiUserService.getJSON()
            async let posts: [Post] = try await apiPostService.getJSON()
            let (fetchedUsers, fetchedPosts) = await (try users, try posts)
            for user in  fetchedUsers {
                let userPosts =  fetchedPosts.filter {$0.userId == user.id}
                let newUserAndPosts = UserAndPosts(user: user, posts: userPosts)
                usersAndPost.append(newUserAndPosts)
            }
            
            
        } catch  {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
        }
    }
}
    
    extension UsersListViewModel {
        convenience init(forPreview: Bool = false) {
            self.init()
            if forPreview {
                self.usersAndPost = UserAndPosts.mockUsersAndPosts
            }
        }
    
    
    
}
