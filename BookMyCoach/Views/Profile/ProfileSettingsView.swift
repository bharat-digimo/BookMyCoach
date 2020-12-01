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
                            Text("Update Profile")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        HStack {
                            Text("Change Password")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: SportsListView()) {
                        HStack {
                            Text("Update Sport")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: Text("Terms of Service")) {
                        HStack {
                            Text("Terms of Service")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: Text("Privacy Policy")) {
                        HStack {
                            Text("Privacy Policy")
                            Spacer()
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }, label: {
                        Text("Logout")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                    })
                    .alert(isPresented:$showAlert) {
                        Alert(title: Text("Logout"), message: Text("Are you sure you want to logout?"), primaryButton: .destructive(Text("Logout")) {
                            logoutTapped()
                        }, secondaryButton: .cancel())
                    }
                    Spacer()
                    
                }
                .padding()
            }
            .navigationBarTitle("Settings")
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
