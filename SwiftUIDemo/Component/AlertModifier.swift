//
//  AlertModifier.swift
//  SwiftUIDemo
//
//  Created by Nikhil Mallik on 08/11/23.
//

import Foundation
import SwiftUI

struct AlertModifier: ViewModifier {
    @Binding var isShowingAlert: Bool
    let title: String
    let message: String
    let primaryButtonTitle: String
    let secondaryButtonTitle: String?
    let primaryAction: () -> Void
    let secondaryAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        content.alert(isPresented: $isShowingAlert) {
            if let secondaryButtonTitle = secondaryButtonTitle {
                return Alert(
                    title: Text(title),
                    message: Text(message),
                    primaryButton: .default(Text(primaryButtonTitle), action: primaryAction),
                    secondaryButton: .cancel(Text(secondaryButtonTitle), action: secondaryAction)
                )
            } else {
                return Alert(
                    title: Text(title),
                    message: Text(message),
                    dismissButton: .default(Text(primaryButtonTitle), action: primaryAction)
                )
            }
        }
    }
}

