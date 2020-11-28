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
    @State private var navBarHidden: Bool = true
    @State private var showProfileView: Bool = false
    
    @Binding var isShowingSignup: Bool
    
    var body: some View {
        NavigationView {
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
                            RadioButton(isSelected: true, text: "Coach")
                            Spacer().frame(width: 30)
                            RadioButton(isSelected: false, text: "Player")
                        }
                        .padding(.vertical, 40)
                        
                        Group {
                            LoginTextField(text: $email, placeholder: "Email", imageName: "envelope")
                                .padding(.horizontal, 20)
                                .padding(.bottom, 15)
                            
                            
                            LoginTextField(text: $password, placeholder: "Create Password", imageName: "lock", isSecure: true)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 15)
                            
                            
                            LoginTextField(text: $confirmPassword, placeholder: "Confirm Password", imageName: "lock", isSecure: true)
                                .padding(.horizontal, 20)
                            
                            Spacer().frame(height: 60)
                            
                            NavigationLink(destination: CoachPersonalInfoView(), isActive: $showProfileView) { EmptyView() }
                            RoundedButton(text: "Next") {
                                showProfileView = true
                            }
                            
                            LoginBottomView(message: "Not the first time here?", buttonTitle: "Log In") {
                                isShowingSignup = false
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(navBarHidden)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                self.navBarHidden = true
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                self.navBarHidden = false
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarHidden(navBarHidden)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
            self.navBarHidden = true
        })
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
            self.navBarHidden = false
        })
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(isShowingSignup: .constant(false))
    }
}
