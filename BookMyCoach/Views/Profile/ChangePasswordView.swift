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
                    Section(header: Text(Constant.enterExistingPassword)) {
                        LoginTextField(text: $existingPassword, placeholder: Constant.existingPassword, imageName: "lock", isSecure: true, includeUnderline: false)
                    }
                    
                    Section(header: Text(Constant.createNewPassword)) {
                        LoginTextField(text: $password, placeholder:Constant.newAccount, imageName: "lock", isSecure: true, includeUnderline: false)
                        
                        LoginTextField(text: $confirmPassword, placeholder: Constant.confirmNewPassword, imageName: "lock", isSecure: true, includeUnderline: false)
                    }
                    
                    
                }
                .navigationBarTitle(Constant.changePassword)
                .listStyle(GroupedListStyle())
                
                Spacer()
                RoundedButton(text: Constant.changePassword, horizontalPadding: 30) {
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
            alertMessage = Constant.enterPassword
            showsAlert = true
        } else if password.isEmpty {
            alertMessage = Constant.enterNewPassword
            showsAlert = true
        } else if confirmPassword.isEmpty {
            alertMessage = Constant.enterConfirmNewPassword
            showsAlert = true
        } else if password != confirmPassword {
            alertMessage = Constant.passwordNotMatch
            showsAlert = true
        } else {
            showLoading = true
            UserManager.shared.activeUser?.changePassword(existingPassword, password, { (success, error) in
                if success {
                    self.mode.wrappedValue.dismiss()
                } else {
                    alertMessage = error?.localizedDescription ?? Constant.somethingWentWrong
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
