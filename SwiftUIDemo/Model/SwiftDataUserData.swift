//
//  SwiftDataUserData.swift
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
        seasonalPhoto: Season = .winter,
        goalDate: Date = Date.now,
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

