//
//  ProfileView.swift
//  swiftUIPractice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var fullname: String
    var email: String

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
    
    init(
        id: String,
        fullname: String,
        email: String
    ) {
        self.id = id
        self.fullname = fullname
        self.email = email
    }
}

struct UserProfile: Identifiable, Codable {
    var user: User
    let id: String
    var prefersNotifications = true
    var seasonalPhoto: Season
    var goalDate = Date()
    
    init(
        user: User,
        id: String,
        prefersNotifications: Bool = true,
        seasonalPhoto: Season = .winter,
        goalDate: Date = Date.now
    ) {
        self.user = user
        self.id = id
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = goalDate
    }
    
}

enum Season: String, CaseIterable, Identifiable, Codable {
    case spring , summer, autumn, winter
    
    var id: String {
        self.rawValue
    }
    var descr: String {
        switch self {
        case .spring:
            "🌷"
        case .summer:
            "🌞"
        case .autumn:
            "🍂"
        case .winter:
            "☃️"
        }
    }
}


