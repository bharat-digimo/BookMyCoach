//
//  CreateAccountView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var selectedColor: Color = .buttonBackground
    
    var body: some View {
        
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                HStack {
                    Text("New\nAccount")
                        .font(.system(size: 42, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                .padding(.bottom, 20)
                
                HStack {
                    RadioButton(isSelected: true, text: "Coach")
                    Spacer().frame(width: 30)
                    RadioButton(isSelected: false, text: "Player")
                }
                
                Group {
                    LoginTextField(text: $email, placeholder: "Email", imageName: "person")
                        .padding()
                    
                    Spacer().frame(height: 10)
                    
                    LoginTextField(text: $password, placeholder: "Create Password", imageName: "lock")
                        .padding()
                    
                    Spacer().frame(height: 10)
                    
                    LoginTextField(text: $confirmPassword, placeholder: "Confirm Password", imageName: "lock")
                        .padding()
                    
                    Spacer().frame(height: 60)
                    
                    RoundedButton(text: "Next")
                    
                    LoginBottomView(message: "Not the first time here?", buttonTitle: "Log In")
                    
                }
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
