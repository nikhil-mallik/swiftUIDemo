//
//  DataItem.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 28/11/23.
//

import Foundation
import SwiftData

@Model
class SwiftDataUserData: Identifiable, ObservableObject {
    let id: String
    var prefersNotifications: Bool
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

    init(
        id: String,
        prefersNotifications: Bool,
        seasonalPhoto: Season,
        goalDate: Date,
        fullname: String,
        email: String
    ) {
        self.id = id
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = goalDate
        self.fullname = fullname
        self.email = email
    }
    
}
enum Season: String, CaseIterable, Identifiable, Codable {
    case spring , summer, autumn = "🍂", winter = "☃️"
    
    var id: Self {
        self
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

extension SwiftDataUserData {
    static var MOCK_USER = SwiftDataUserData(
        id: "",
        prefersNotifications: true,
        seasonalPhoto: .winter,
        goalDate: Date.now,
        fullname: "Default user",
        email: "default@gmail.com"
    )
}
