//
//  ProfileView.swift
//  swiftUIPractice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
//    let confirmPassword: String?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(
            from: fullname
        ) {
            formatter.style = .abbreviated
            return formatter.string(
                from: components
            )
        }
        
        return ""
    }
}

struct UserProfile: Identifiable, Codable {
    let id: String
    var prefersNotifications = true
    var seasonalPhoto: Season
    var goalDate = Date()
    var fullname: String
    let email: String
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(
            from: fullname
        ) {
            formatter.style = .abbreviated
            return formatter.string(
                from: components
            )
        }
        return ""
    }
    
    enum Season: String, CaseIterable, Identifiable, Codable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String {
            rawValue
        }
    }
}
