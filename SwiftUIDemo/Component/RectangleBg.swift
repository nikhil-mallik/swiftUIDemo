//
//  RectangleBg.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 21/11/23.
//

import SwiftUI

struct RectangleBg: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .ignoresSafeArea(edges: .all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .ignoresSafeArea(edges: .all)
        }
    }
}

#Preview {
    RectangleBg()
}
