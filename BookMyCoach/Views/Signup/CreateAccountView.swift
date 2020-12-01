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
            
            VStack {
                
                HStack {
                    Text(Constant.newAccount)
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
                        LoginTextField(text: $email, placeholder: Constant.email, imageName: "envelope")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                            .keyboardType(.emailAddress)
                        
                        
                        LoginTextField(text: $password, placeholder: Constant.createPassword, imageName: "lock", isSecure: true)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                            .textContentType(.password)
                        
                        LoginTextField(text: $confirmPassword, placeholder: Constant.confirmPassword, imageName: "lock", isSecure: true)
                            .padding(.horizontal, 20)
                            .textContentType(.password)
                        
                        Spacer().frame(height: 60)
                        
                        NavigationLink(destination: PersonalInfoView(), isActive: $showProfileView) { EmptyView() }
                        RoundedButton(text: Constant.next) {
                            nextTapped()
                        }
                        
                        LoginBottomView(message: Constant.notFirstTimeHere, buttonTitle: Constant.log_in) {
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
            alertMessage = Constant.enterValidEmail
            showsAlert = true
        } else if password.isEmpty {
            alertMessage = Constant.enterPassword
            showsAlert = true
        } else if confirmPassword.isEmpty {
            alertMessage = Constant.confirmYourPassword
            showsAlert = true
        } else if confirmPassword != password {
            alertMessage = Constant.passwordNotMatch
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
                    alertMessage = error?.localizedDescription ?? Constant.somethingWentWrong
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
