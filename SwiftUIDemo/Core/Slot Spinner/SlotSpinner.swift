//
//  SlotSpinner.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 21/11/23.
//

import SwiftUI

struct SlotSpinner: View {
    
    @State private var images = ["twinlake", "rainbowlake", "umbagog"]
    @State private var numbers = [1, 2, 0]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var showAlert = false
    @State private var credits = 1000
    private var betAmount = 5
    
    
    var body: some View {
        ZStack {
            RectangleBg()
            VStack{
                Spacer()
                HStack {
                    Image(systemName: starFillIcon)
                        .foregroundColor(.yellow)
                    Text(slotSpinnerTitle)
                        .foregroundStyle(Color.white)
                        .bold()
                    Image(systemName: starFillIcon)
                        .foregroundColor(.yellow)
                }
                .scaleEffect(2)
                
                Spacer()
                
                Text("Credits: " + String(credits))
                    .foregroundStyle(Color.black)
                    .padding(.all, 10)
                    .background(backgrounds[0].opacity(0.5))
                    .cornerRadius(20.0)
                
                Spacer()
                
                HStack {
                    CardView(image: $images[numbers[0]], background: $backgrounds[0])
                    CardView(image: $images[numbers[1]], background: $backgrounds[1])
                    CardView(image: $images[numbers[2]], background: $backgrounds[2])
                    
                }
                Spacer()
                
                Button(action: {
                    // Set Background back to white
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    // Change the images
                    self.numbers = self.numbers.map { _ in
                        Int.random(in: 0...self.images.count - 1)
                    }
                    
                    //Check winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        
                        
                        //Won
                        self.credits += betAmount * 10
                        
                        // Set Background to Green
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.green
                        }
                        self.showAlert = true
                    } else {
                        self.credits -= betAmount
                    }
                    
                }, label: {
                    Text(spinButtonTitle)
                        .bold()
                        .foregroundStyle(Color.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .clipShape(.capsule)
                })
                .modifier(AlertModifier(isShowingAlert: $showAlert, title: wonTitle, message: gotMatch, primaryButtonTitle: okButton, secondaryButtonTitle: nil, primaryAction: { self.showAlert = false }, secondaryAction: nil))
                Spacer()
            }
            
        }
    }
}

#Preview {
    SlotSpinner()
}
