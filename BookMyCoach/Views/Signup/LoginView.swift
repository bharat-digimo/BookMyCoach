//
//  LoginView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                HStack {
                    Text("Login")
                        .font(.system(size: 42, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                .padding(.bottom, 100)
                
                LoginTextField(text: $email, placeholder: "Email", imageName: "person")
                    .padding()
                
                Spacer().frame(height: 20)
                
                LoginTextField(text: $password, placeholder: "Password", imageName: "lock")
                    .padding()
                
                Spacer().frame(height: 60)
                
                RoundedButton(text: "Login")
                
                LoginBottomView(message: "First time here?", buttonTitle: "Signup")
                
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginTextField: View {
    @Binding var text: String
    var placeholder: String
    var imageName: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                    .font(.title)
                    .padding(.leading, 10)
                
                TextField(placeholder, text: $text)
                    .padding()
                    .foregroundColor(.white)
                    .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty,
                                               placeholder: placeholder))
                
            }
            Color.gray.frame(height: CGFloat(1) / UIScreen.main.scale)
                .padding(.horizontal, 10)
        }
    }
}

struct RoundedButton: View {
    var text: String
    var body: some View {
        Button(action: {}, label: {
            Text(text)
                .font(.system(size: 34, weight: .bold))
                .padding(.horizontal, 120)
                .padding(.vertical, 18)
                .background(Color.buttonBackground)
                .cornerRadius(35)
                .foregroundColor(.white)
                .shadow(radius: 10)
        })
    }
}

struct LoginBottomView: View {
    var message: String
    var buttonTitle: String
    var body: some View {
        HStack {
            Text(message)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text(buttonTitle)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue).opacity(0.85)
            })
        }
        .padding()
    }
}
