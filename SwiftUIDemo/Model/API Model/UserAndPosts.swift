//
//  UserAndPosts.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import Foundation

struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: UserApi
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
