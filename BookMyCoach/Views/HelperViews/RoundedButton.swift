//
//  RoundedButton.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var horizontalPadding = CGFloat(110)
    var action: (() -> Void)?
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Text(text)
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, 14)
                .background(Color.buttonBackground)
                .cornerRadius(35)
                .foregroundColor(.white)
                .shadow(radius: 10)
        })
    }
}
