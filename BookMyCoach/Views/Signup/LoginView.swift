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
    @State private var isShowingSignupView = false
    @State private var isUserLogedIn = false
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    var body: some View {
        NavigationView {
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
                    ScrollView {
                        VStack {
                            LoginTextField(text: $email, placeholder: "Email", imageName: "envelope")
                                .padding()
                            
                            LoginTextField(text: $password, placeholder: "Password", imageName: "lock", isSecure: true)
                                .padding()
                            
                            Spacer().frame(height: 60)
                            NavigationLink(destination: Text("Dashboard"), isActive: $isUserLogedIn) { EmptyView() }
                            RoundedButton(text: "Login") {
                                isUserLogedIn = true
                            }
                            
                            NavigationLink(destination: CreateAccountView(isShowingSignup: $isShowingSignupView), isActive: $isShowingSignupView) { EmptyView() }
                            LoginBottomView(message: "First time here?", buttonTitle: "Signup") {
                                isShowingSignupView = true
                            }
                        }
                        .padding(.top, 100)
                    }
                    
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
