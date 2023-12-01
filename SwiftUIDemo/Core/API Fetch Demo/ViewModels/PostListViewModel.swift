//
//  PostListViewModel.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    var userId: Int?
    
    @MainActor
    func fetchPosts() async {
        if let userId = userId {
            let apiService = APIServices(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            isLoading.toggle()
            defer {
                isLoading.toggle()
            }
            do {
                posts = try await apiService.getJSON()
            } catch {
                showAlert = true
                errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
            }
        }
    }
}

extension PostListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.posts = Post.mockSingleUsersPostArray
        }
    }
}
