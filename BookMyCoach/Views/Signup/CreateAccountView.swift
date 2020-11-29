//
//  CreateAccountView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI
import ActivityIndicatorView

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var selectedColor: Color = .buttonBackground
    @State private var navBarHidden: Bool = true
    @State private var showProfileView: Bool = false
    @State private var userType: UserType = UserType.player
    @State private var showsAlert = false
    @State private var alertMessage = ""
    @State private var showLoading = false
    
    @Binding var isShowingSignup: Bool
    
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
                
                ScrollView {
                    HStack {
                        RadioButton(userType: $userType, text: UserType.player.rawValue.capitalized)
                        Spacer().frame(width: 30)
                        RadioButton(userType: $userType, text: UserType.coach.rawValue.capitalized)
                    }
                    .padding(.vertical, 40)
                    
                    Group {
                        LoginTextField(text: $email, placeholder: "Email", imageName: "envelope")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                            .keyboardType(.emailAddress)
                        
                        
                        LoginTextField(text: $password, placeholder: "Create Password", imageName: "lock", isSecure: true)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                            .textContentType(.password)
                        
                        LoginTextField(text: $confirmPassword, placeholder: "Confirm Password", imageName: "lock", isSecure: true)
                            .padding(.horizontal, 20)
                            .textContentType(.password)
                        
                        Spacer().frame(height: 60)
                        
                        NavigationLink(destination: CoachPersonalInfoView(), isActive: $showProfileView) { EmptyView() }
                        RoundedButton(text: "Next") {
                            nextTapped()
                        }
                        
                        LoginBottomView(message: "Not the first time here?", buttonTitle: "Log In") {
                            isShowingSignup = false
                        }
                        
                    }
                }
            }
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
        }
        .navigationTitle("")
        .navigationBarHidden(navBarHidden)
        .alert(isPresented: $showsAlert, content: {
            Alert(title: Text(alertMessage))
        })
    }
    
    private func nextTapped() {
        if email.isEmpty || !email.isValidEmail {
            alertMessage = "Please enter a valid email address."
            showsAlert = true
        } else if password.isEmpty {
            alertMessage = "Please enter your password."
            showsAlert = true
        } else if confirmPassword.isEmpty {
            alertMessage = "Please confirm your password."
            showsAlert = true
        } else if confirmPassword != password {
            alertMessage = "Your password do not match."
            showsAlert = true
        } else {
            showLoading = true
            hideKeyboard()
            User.register(UserRegisterRequest(fullName: "No name", email: email, password: password, userType: userType)) { (user, error) in
                showLoading = false
                if error == nil {
                    UserManager.shared.activeUser = user
                    showProfileView = true
                } else {
                    alertMessage = error?.localizedDescription ?? "Something went wrong!!"
                    showsAlert = true
                }
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(isShowingSignup: .constant(false))
    }
}
