//
//  BookMyCoachApp.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

@main
struct BookMyCoachApp: App {
    
    var userManager: UserManager = UserManager.shared
    
    init() {
        StorageManager.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            if UserManager.shared.isLoggedInUser() == false {
                LoginView().environmentObject(userManager)
            } else {
                if userManager.activeUser?.isProfileComplete == true {
                    if userManager.activeUser?.userType == UserType.coach {
                        CoachTabView().environmentObject(userManager)
                    } else {
                        PlayerTabView().environmentObject(userManager)
                    }
                } else {
                    PersonalInfoNavigationView().environmentObject(userManager)
                }
                
            }
            
        }
    }
}

struct PersonalInfoNavigationView: View {
    
    var body: some View {
        NavigationView {
            PersonalInfoView()
                .navigationBarHidden(true)
        }
    }
    
}
