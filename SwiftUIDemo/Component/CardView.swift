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
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .clipShape(.buttonBorder)
            .padding()
            .background(background.opacity(0.5))
//            .clipShape(.buttonBorder)
            .clipShape(.buttonBorder)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
           
        
    }
}

#Preview {
    CardView(image: Binding.constant("twinlake"), background: Binding.constant(Color.red))
}
