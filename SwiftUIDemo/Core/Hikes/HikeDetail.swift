//
//  HikeDetail.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 28/09/23.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation

    var buttons = [
        (elevationButtonTitle, \Hike.Observation.elevation),
        (heartRateButtonTitle, \Hike.Observation.heartRate),
        (paceButtonTitle, \Hike.Observation.pace)
    ]

    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)

            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == dataToShow
                                ? .gray
                                : .accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

#Preview {
    HikeDetail(hike: ModelData().hikes[0])
}
