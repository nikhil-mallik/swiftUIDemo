//
//  ProfileUpdate.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 28/11/23.
//

import SwiftUI
import SwiftData

struct ProfileUpdate: View {
    
    //    @Environment(\.modelContext) var user
    
    
    @State private var fname = ""
    @State private var email = ""
    @State private var prefersNotification = true
    @State private var seasonPhoto = Season.winter
    @State private var goalDate = Date.now
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var profile: UserProfile //userData
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: goalDate)!
        return min...max
    }
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $fname)
            }
            
            Toggle(isOn: $prefersNotification) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Season", selection: $seasonPhoto) {
                    ForEach(Season.allCases) { seasonPhoto in
                        Text(seasonPhoto.descr).tag(seasonPhoto)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
            Button {
//                updateData()
//                profile.fullname = fname
//                profile.prefersNotifications = prefersNotification
//                profile.seasonalPhoto = seasonPhoto
//                profile.goalDate = goalDate
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                print("Dismiss")
                dismiss()
            } label: {
                Text("Update")
            }
        }
        .onAppear {
            fname = profile.fullname
            email = profile.email
            prefersNotification = profile.prefersNotifications
//            seasonPhoto = profile.seasonalPhoto
            goalDate = profile.goalDate
        }
    }
    
//    func updateData() {
//        profile.fullname = fname
//        profile.prefersNotifications = prefersNotification
//        profile.seasonalPhoto = seasonPhoto
//        profile.goalDate = goalDate
//        do {
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//        print("Dismiss")
//        dismiss()
//    }
    
    
}

//#Preview {
//    ProfileUpdate(profile: userData.MOCK_USER)
//}
