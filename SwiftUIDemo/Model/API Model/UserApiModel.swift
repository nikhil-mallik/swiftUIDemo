//
//  UserApiModel.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 01/12/23.
//

import Foundation

// Source: https://jsonplaceholder.typicode.com/users

struct UserApi: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
