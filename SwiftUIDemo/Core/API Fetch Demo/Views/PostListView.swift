//
//  PostListView.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import SwiftUI

struct PostListView: View {
    var posts: [Post]

    var body: some View {
        List {
            ForEach(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.callout)
                        .foregroundStyle(Color.secondary)
                }
                
            }
        }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
}

#Preview {
    NavigationView {
        PostListView(posts: Post.mockSingleUsersPostArray)
    }
}
