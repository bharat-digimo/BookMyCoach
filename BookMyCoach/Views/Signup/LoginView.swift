//
//  LoginView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI
import ActivityIndicatorView

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingSignupView = false
    @State private var showCompleteProfile = false
    @State private var showsAlert = false
    @State private var alertMessage = ""
    @State private var showLoading = false
    @State private var showPlayerDashboard = false
    @State private var showCoachDashboard = false
        
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.themeBackground.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        Text(Constant.login)
                            .font(.system(size: 42, weight: .bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    ScrollView {
                        VStack {
                            LoginTextField(text: $email, placeholder: Constant.email, imageName: "envelope")
                                .keyboardType(.emailAddress)
                                .padding()
                            
                            LoginTextField(text: $password, placeholder: Constant.password, imageName: "lock", isSecure: true)
                                .padding()
                            
                            Spacer().frame(height: 60)
                            NavigationLink(destination: PersonalInfoView(), isActive: $showCompleteProfile) { EmptyView() }
                            RoundedButton(text: Constant.login) {
                                loginTapped()
                            }
                            
                            NavigationLink(destination: CreateAccountView(isShowingSignup: $isShowingSignupView), isActive: $isShowingSignupView) { EmptyView() }
                            
                            Spacer().frame(height: 20)
                            
                            LoginBottomView(message: Constant.firstTimeHere, buttonTitle: Constant.signup) {
                                isShowingSignupView = true
                            }
                        }
                        .padding(.top, 100)
                    }
                }
                ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                    .frame(width: 100, height: 100)
            }
            .fullScreenCover(isPresented: $showPlayerDashboard, content: {
                PlayerTabView()
            })
            .fullScreenCover(isPresented: $showCoachDashboard, content: {
                CoachTabView()
            })
            .alert(isPresented: $showsAlert, content: {
                Alert(title: Text(alertMessage))
            })
            .navigationBarHidden(true)
        }
    }
    
    private func loginTapped() {
        if email.isEmpty {
            alertMessage = Constant.enterEmail
            showsAlert = true
        } else if password.isEmpty {
            alertMessage = Constant.enterPassword
            showsAlert = true
        } else {
            showLoading = true
            hideKeyboard()
            User.login(UserLoginRequest(email: email, password: password)) { (user, error) in
                showLoading = false
                if error == nil {
                    UserManager.shared.activeUser = user
                    if user?.isProfileComplete == true {
                        if user?.userType == UserType.player {
                            showPlayerDashboard = true
                        } else {
                            showCoachDashboard = true
                        }
                    } else {
                        showCompleteProfile = true
                    }
                } else {
                    alertMessage = error?.localizedDescription ?? Constant.invalidCredentials
                    showsAlert = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
