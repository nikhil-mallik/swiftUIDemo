//
//  InputView.swift
//  swiftUIPractice
//
//  Created by Nikhil Mallik on 07/11/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String           // Parameter for the text field
    let title: String                   // Parameter for the title field
    let placeholder: String             // Parameter for the placeholder/ hint
    @Binding var isSecureField: Bool    // Parameter for the secure field
    let showEyeButton: Bool             // Parameter for eye the button
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            HStack {
                if isSecureField && showEyeButton {
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
                        Image(systemName: isSecureField ? eyeSlashIcon : eyeIcon)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Divider()
                .foregroundColor(.black)
        }
    }
}
