//
//  RoundedButton.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var action: (() -> Void)?
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Text(text)
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 110)
                .padding(.vertical, 14)
                .background(Color.buttonBackground)
                .cornerRadius(35)
                .foregroundColor(.white)
                .shadow(radius: 10)
        })
    }
}
