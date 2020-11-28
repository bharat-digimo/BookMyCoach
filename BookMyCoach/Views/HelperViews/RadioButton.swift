//
//  RadioButton.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct RadioButton: View {
    var isSelected: Bool
    var text: String
    
    var body: some View {
        
        ZStack {
            let fillColor = isSelected ? Color.buttonBackground : Color.clear
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.white)
                .background(fillColor)
            
            HStack {
                if isSelected {
                    Circle()
                        .frame(width: 20, height: 20)
                } else {
                    Circle()
                        .stroke(Color.white)
                        .frame(width: 20, height: 20)
                }
                
                Text(text)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 5)
            }
            .padding()
            .foregroundColor(.white)
        }
        .overlay(RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.white))
        .frame(width: 150, height: 50)
//        background(Color.themeBackground)
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.buttonBackground.edgesIgnoringSafeArea(.all)
            RadioButton(isSelected: true, text: "Coach")
        }
    }
}
