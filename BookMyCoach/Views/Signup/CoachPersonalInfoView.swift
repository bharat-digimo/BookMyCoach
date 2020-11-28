//
//  CoachPersonalInfoView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct CoachPersonalInfoView: View {
    @State private var fullName: String = ""
    @State private var hourlyRate: String = ""
    @State private var bio: String = ""
    @State private var location: String = ""
    var body: some View {
        
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Tell us more about you.")
                        .font(.system(size: 42, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                
                ScrollView {
                    VStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(Color.buttonBackground)
                                    .frame(width: 150, height: 150)
                                Image(systemName: "person")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(.buttonBackground)
                            }
                            
                            Text("Choose a profile photo (Optional)")
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        
                        LoginTextField(text: $fullName, placeholder: "Full Name", imageName: "person")
                            .padding()
                        LoginTextField(text: $hourlyRate, placeholder: "Hourly Rate", imageName: "dollarsign.circle")
                            .padding()
    //                    TextEditor(text: $bio)
                        LoginTextField(text: $bio, placeholder: "Bio", imageName: "highlighter")
                            .padding()
                        Spacer().frame(height: 40)
                        RoundedButton(text: "Next")
                    }
                }
            }
        }
    }
}

struct CoachPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CoachPersonalInfoView()
    }
}
