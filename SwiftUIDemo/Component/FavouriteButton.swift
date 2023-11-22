//
//  FavouriteButton.swift
//  swiftUI-practice
//
//  Created by Nikhil Mallik on 28/09/23.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label(toggleFavorite, systemImage: isSet ? starFillIcon : starIcon)
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}

