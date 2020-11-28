//
//  LoginTextField.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct LoginTextField: View {
    @Binding var text: String
    var placeholder: String
    var imageName: String
    var isSecure: Bool = false
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                    .font(.title)
                    .padding(.leading, 10)
                if !isSecure {
                    TextField(placeholder, text: $text)
                        .padding()
                        .foregroundColor(.white)
                        .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty,
                                                   placeholder: placeholder))
                } else {
                    SecureField(placeholder, text: $text)
                        .padding()
                        .foregroundColor(.white)
                        .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty,
                                                   placeholder: placeholder))
                }
                
            }
            Color.gray.frame(height: CGFloat(1) / UIScreen.main.scale)
                .padding(.horizontal, 10)
        }
    }
}
