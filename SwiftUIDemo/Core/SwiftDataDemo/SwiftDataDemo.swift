//
//  SwiftDataDemo.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 28/11/23.
//
// The below code is the demo of the SwiftData CRUD with hard core data.

import SwiftUI
import SwiftData

struct SwiftDataDemo: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \SwiftDataUserData.id) private var items: [SwiftDataUserData]

    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            VStack {
                HStack(spacing: 4) {
                    
                    VStack(alignment: .leading, spacing: 4 ) {
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text(user.email)
                            .font(.footnote)
                            .foregroundStyle(Color(.gray))
                    }
                }
                
                List {
                    ForEach(items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.id)
                                Text(item.fullname)
                                Text(item.email)
                            }
                            Button {
                                updateData(item)
                            } label: {
                                Text("Button")
                            }
                        }
                    }
                    .onDelete { indexes in
                        for index in indexes {
                            deleteData(items[index])
                        }
                    }
                }
            }
        }
    }
    
    func deleteData(_ item: SwiftDataUserData) {
        context.delete(item)
    }
    
    func updateData(_ item: SwiftDataUserData) {
        item.fullname = "Updated"
        try! context.save()
    }
    
}

#Preview {
    SwiftDataDemo()
}
