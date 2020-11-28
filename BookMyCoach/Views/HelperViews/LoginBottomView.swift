//
//  LoginBottomView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct LoginBottomView: View {
    var message: String
    var buttonTitle: String
    var action: (()-> Void)?
    var body: some View {
        HStack {
            Text(message)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
            Button(action: {
                action?()
            }, label: {
                Text(buttonTitle)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue).opacity(0.85)
            })
        }
        .padding()
    }
}
