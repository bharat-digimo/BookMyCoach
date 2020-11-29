//
//  RadioButton.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct RadioButton: View {
    
    @Binding var userType: UserType
    var text: String
    
    var body: some View {
        ZStack {
            if userType.rawValue.lowercased() == text.lowercased() {
                Color.buttonBackground.cornerRadius(25)
            }
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.white)
            HStack {
                if userType.rawValue.lowercased() == text.lowercased() {
                    Circle()
                        .frame(width: 15, height: 15)
                } else {
                    Circle()
                        .stroke(Color.white)
                        .frame(width: 15, height: 15)
                }
                
                Text(text)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal, 5)
            }
            .padding()
            .foregroundColor(.white)
        }
        .onTapGesture(perform: {
            if let selectedType = UserType(rawValue: text.lowercased()) {
                withAnimation {
                    userType = selectedType
                }
            }
        })
        .frame(width: 150, height: 30)
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            RadioButton(userType: .constant(UserType.coach), text: UserType.coach.rawValue.capitalized)
        }
    }
}
