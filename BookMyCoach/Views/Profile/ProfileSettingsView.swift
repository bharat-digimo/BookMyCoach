//
//  ProfileSettingsView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/30/20.
//

import SwiftUI
import ActivityIndicatorView

struct ProfileSettingsView: View {
    
    @State private var showAlert = false
    @State private var showLoading = false
    @State private var showLoginView = false
    @State private var showEditProfile = false
    
    var body: some View {
        ZStack {
            List {
                Section {
                    NavigationLink(destination: PersonalInfoView(viewType: .edit)) {
                        HStack {
                            Text(Constant.updateProfile)
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        HStack {
                            Text(Constant.changePassword)
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: SportsListView(viewType: .edit, oldSport: UserManager.shared.activeUser?.userSports?.first?.sport)) {
                        HStack {
                            Text(Constant.updateSport)
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: Text(Constant.termsOfService)) {
                        HStack {
                            Text(Constant.termsOfService)
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: Text(Constant.privacyPolicy)) {
                        HStack {
                            Text(Constant.privacyPolicy)
                            Spacer()
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }, label: {
                        Text(Constant.logout)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                    })
                    .alert(isPresented:$showAlert) {
                        Alert(title: Text(Constant.logout), message: Text(Constant.sureAboutLogout), primaryButton: .destructive(Text(Constant.logout)) {
                            logoutTapped()
                        }, secondaryButton: .cancel())
                    }
                    Spacer()
                    
                }
                .padding()
            }
            .navigationBarTitle(Constant.settings)
            .listStyle(GroupedListStyle())
            
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
        }
        .onDisappear(perform: {
           _ =  EmptyView() // a little trick to correct the back button title animation
        })
        .fullScreenCover(isPresented: $showLoginView, content: {
            LoginView()
        })
        
    }
    
    private func logoutTapped() {
        showLoading = true
        UserManager.shared.activeUser?.logout({ (success, error) in
            showLoading = false
            if success {
                showLoginView = true
            }
        })
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
