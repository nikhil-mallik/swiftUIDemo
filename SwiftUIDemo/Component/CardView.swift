//
//  CardView.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 21/11/23.
//

import SwiftUI

struct CardView: View {
    
    @Binding var image:String
    @Binding var background:Color
    
    private let transition: AnyTransition = AnyTransition.move(edge: .bottom)
    
    var body: some View {
        VStack {
            if image == "twinlake" {
                Image(image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            } else if image == "rainbowlake" {
                Image(image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            } else {
                Image(image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            }
        }
        .clipShape(.buttonBorder)
        .padding()
        .background(background.opacity(0.5))
        .clipShape(.buttonBorder)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        
    }
}

#Preview {
    CardView(image: Binding.constant("twinlake"), background: Binding.constant(Color.red))
}
