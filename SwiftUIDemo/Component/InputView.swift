//
//  InputView.swift
//  swiftUIPractice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    @State private var isSecureField = true
    let showEyeButton: Bool // Added parameter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            HStack {
                if isSecureField {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 14))
                } else {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                }
                
                if showEyeButton { 
                    Button(action: {
                        isSecureField.toggle()
                    }) {
                        Image(systemName: isSecureField ? "eye.slash" : "eye")
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Divider()
                .foregroundColor(.black)
        }
    }
}
