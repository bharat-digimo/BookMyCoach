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
                                .keyboardType(.emailAddress)
                                .padding()
                            
                            LoginTextField(text: $password, placeholder: "Password", imageName: "lock", isSecure: true)
                                .padding()
                            
                            Spacer().frame(height: 60)
                            NavigationLink(destination: PersonalInfoView(), isActive: $showCompleteProfile) { EmptyView() }
                            RoundedButton(text: "Login") {
                                loginTapped()
                            }
                            
                            NavigationLink(destination: CreateAccountView(isShowingSignup: $isShowingSignupView), isActive: $isShowingSignupView) { EmptyView() }
                            
                            Spacer().frame(height: 20)
                            
                            LoginBottomView(message: "First time here?", buttonTitle: "Signup") {
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
                ContentView()
            })
            .fullScreenCover(isPresented: $showCoachDashboard, content: {
                CoachTabBar()
            })
            .alert(isPresented: $showsAlert, content: {
                Alert(title: Text(alertMessage))
            })
            .navigationBarHidden(true)
        }
    }
    
    private func loginTapped() {
        if email.isEmpty {
            alertMessage = "Please enter email"
            showsAlert = true
        } else if password.isEmpty {
            alertMessage = "Please enter your password"
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
                    alertMessage = error?.localizedDescription ?? "You have entered invalid credentials"
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
