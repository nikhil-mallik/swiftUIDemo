//
//  SlotSpinner.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 21/11/23.
//

import SwiftUI

struct SlotSpinner: View {
    
    @State private var images = ["twinlake", "rainbowlake", "umbagog"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var showAlert = false
    @State private var showAnnimation = false
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        
        ZStack {
            // background
            RectangleBg()
            
            // Title
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
                
                // Spacer
                Spacer()
                
                // display the credit
                Text("Credits: " + String(credits))
                    .foregroundStyle(Color.black)
                    .padding(.all, 10)
                    .background(showAnnimation ? Color.green.opacity(0.5) : backgrounds[0].opacity(0.5))
                    .cornerRadius(20.0)
                    .scaleEffect(showAnnimation ? 1.2 : 1)
                    
                    
                
                // Spacer
                Spacer()
                
                // Card View display
                VStack {
                    HStack {
                        CardView(image: $images[numbers[0]], background: $backgrounds[0])
                        CardView(image: $images[numbers[1]], background: $backgrounds[1])
                        CardView(image: $images[numbers[2]], background: $backgrounds[2])
                    }
                    HStack {
                        CardView(image: $images[numbers[3]], background: $backgrounds[3])
                        CardView(image: $images[numbers[4]], background: $backgrounds[4])
                        CardView(image: $images[numbers[5]], background: $backgrounds[5])
                    }
                    HStack {
                        CardView(image: $images[numbers[6]], background: $backgrounds[6])
                        CardView(image: $images[numbers[7]], background: $backgrounds[7])
                        CardView(image: $images[numbers[8]], background: $backgrounds[8])
                    }
                }
                
                // Spacer
                Spacer()
                
                // Spin Button
                HStack(spacing: 50) {
                    // Only middle row spin Button
                    VStack {
                        Button(action: {
                            // Process for Single middle row spin
                            self.processSpinResult()
                        }, label: {
                            Text(spinButtonTitle)
                                .bold()
                                .foregroundStyle(Color.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(credits < 5 ? Color.gray : Color.pink)
                                .clipShape(.capsule)
                        })
                        .disabled(self.credits < 5)
                        .modifier(AlertModifier(isShowingAlert: $showAlert, title: wonTitle, message: gotMatch, primaryButtonTitle: okButton, secondaryButtonTitle: nil, primaryAction: {
                            self.showAlert = false
                            self.processSpinResult()
                       }, secondaryAction: nil))
                        
                        // Text
                        Text("\(betAmount) credits")
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                    
                    // Max Spin Button
                    VStack {
                        Button(action: {
                            // Process for max spin all card
                            self.processSpinResult(true)
                        }, label: {
                            Text(maxSpinButtonTitle)
                                .bold()
                                .foregroundStyle(Color.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(credits < 25 ? Color.gray : Color.pink)
                                .clipShape(.capsule)
                        })
                        .disabled(self.credits < 25)
                        .modifier(AlertModifier(isShowingAlert: $showAlert, title: wonTitle, message: gotMatch, primaryButtonTitle: okButton, secondaryButtonTitle: nil, primaryAction: {
                            self.showAlert = false
                            self.processSpinResult(true)
                        }, secondaryAction: nil))
                        
                        // Text
                        Text("\(betAmount * 5) credits")
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                }
                
                // Spacer
                Spacer()
            }
        }
        .animation(.easeOut)
    }
    
    func processSpinResult(_ isMax:Bool = false) {
        // Set Background back to white
        self.backgrounds = self.backgrounds.map { _ in
            Color.white
        }
        
        if isMax {
            // Change all the cards
            self.numbers = self.numbers.map { _ in
                Int.random(in: 0...self.images.count - 1)
            }
        } else {
            // Change middle row cards only
            self.numbers[3] = Int.random(in: 0...self.images.count - 1)
            self.numbers[4] = Int.random(in: 0...self.images.count - 1)
            self.numbers[5] = Int.random(in: 0...self.images.count - 1)
        }
        
        //Check winnings
        processWin(isMax)
        
    }
    func processWin(_ isMax:Bool = false) {
        
        var matches = 0
        
        if !isMax {
            // Processing for single spin means middle row only
            if isMatch(3, 4, 5) { matches += 1 }
            
        } else {
            // Processing for max spin means all cards
            
            // Top row
            if isMatch(0, 1, 2) { matches += 1 }
            
            // Middle row
            if isMatch(3, 4, 5) { matches += 1 }
            
            // Buttom row
            if isMatch(6, 7, 8) { matches += 1 }
            
            // Topleft to Buttomright
            if isMatch(0, 4, 8) { matches += 1 }
            
            // TopRight to Buttomleft
            if isMatch(2, 4, 6) { matches += 1 }
        }
        
        // Reseting the annimation
        self.showAnnimation = false
        
        // Check matches and distribute credits
        if matches > 0 {
            // At least 1 win
            self.credits += matches * betAmount * 3
            
            // Annimation effect
            self.showAnnimation = true
            
        } else if !isMax {
            // 0 wins, single spin
            self.credits -= betAmount
            
        } else {
            // 0 wins, max spin
            self.credits -= betAmount * 5
        }
    }
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool {
        
        if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3] {
            
            // Set Background to Green
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            
            // Showing the alert
//            self.showAlert = true
            
            return true
        }
        
        return false
    }
}

#Preview {
    SlotSpinner()
}
