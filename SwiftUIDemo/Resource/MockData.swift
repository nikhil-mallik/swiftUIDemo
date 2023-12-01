//
//  MockData.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import Foundation

extension User {
    static var MOCK_USER = User(
        id: NSUUID().uuidString,
        fullname: "Nikhil Mallik",
        email: "nikhil@gmail.com"
    )
}

extension UserProfile {
    static var MOCK_USER = UserProfile(
        user: User.MOCK_USER,
        id: NSUUID().uuidString,
        seasonalPhoto: .winter
    )
}

extension SwiftDataUserData {
    static var MOCK_USER = SwiftDataUserData(
        id: NSUUID().uuidString,
        prefersNotifications: true,
        seasonalPhoto: .winter,
        goalDate: Date.now,
        fullname: "Default user",
        email: "default@gmail.com"
    )
}

// API fetch Data MOCK Data

extension UserApi {
    static var mockUsers: [UserApi] {
        Bundle.main.decode([UserApi].self, from: "users.json")
    }
    
    static var mockSingleUser: UserApi {
        Self.mockUsers[0]
    }
}

extension Post {
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "posts.json")
    }
    
    static var mockSinglePost: Post {
        Self.mockPosts[0]
    }
    
    static var mockSingleUsersPostArray: [Post] {
        Self.mockPosts.filter { $0.userId == 1 }
    }
}

extension UserAndPosts {
    static var mockUsersAndPosts: [UserAndPosts] {
        var newUsersAndPosts: [UserAndPosts] = []
        for user in UserApi.mockUsers {
            let newUserAndPosts = UserAndPosts(user: user, posts: Post.mockPosts.filter { $0.userId == user.id})
            newUsersAndPosts.append(newUserAndPosts)
        }
        return newUsersAndPosts
    }
}



