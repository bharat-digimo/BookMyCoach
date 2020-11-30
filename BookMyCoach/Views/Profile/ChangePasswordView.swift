//
//  ChangePasswordView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/30/20.
//

import SwiftUI
import ActivityIndicatorView

struct ChangePasswordView: View {
    @State private var existingPassword = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var alertMessage = ""
    @State private var showsAlert = false
    @State private var showLoading = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Section(header: Text("Enter your existing password")) {
                        LoginTextField(text: $existingPassword, placeholder: "Existing Password", imageName: "lock", isSecure: true, includeUnderline: false)
                    }
                    
                    Section(header: Text("Create new password")) {
                        LoginTextField(text: $password, placeholder: "New Password", imageName: "lock", isSecure: true, includeUnderline: false)
                        
                        LoginTextField(text: $confirmPassword, placeholder: "Confirm New Password", imageName: "lock", isSecure: true, includeUnderline: false)
                    }
                    
                    
                }
                .navigationBarTitle("Change Password")
                .listStyle(GroupedListStyle())
                
                Spacer()
                RoundedButton(text: "Change Password", horizontalPadding: 30) {
                    changePasswordTapped()
                }
                .padding(.bottom, 20)
            }
            .alert(isPresented: $showsAlert, content: {
                Alert(title: Text(alertMessage))
            })
            
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
        }
    }
    
    private func changePasswordTapped() {
        
        if existingPassword.isEmpty {
            alertMessage = "Please enter your password."
            showsAlert = true
        } else if password.isEmpty {
            alertMessage = "Please enter your new password."
            showsAlert = true
        } else if confirmPassword.isEmpty {
            alertMessage = "Please confirm your new password."
            showsAlert = true
        } else if password != confirmPassword {
            alertMessage = "Your password does not match.."
            showsAlert = true
        } else {
            showLoading = true
            UserManager.shared.activeUser?.changePassword(existingPassword, password, { (success, error) in
                if success {
                    self.mode.wrappedValue.dismiss()
                } else {
                    alertMessage = error?.localizedDescription ?? "Something went wrong!!"
                    showsAlert = true
                }
            })
        }
        
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
