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
    
    var body: some Scene {
        WindowGroup {
            if UserManager.shared.isLoggedInUser() == false {
                LoginView().environmentObject(userManager)
            } else {
                if userManager.activeUser?.isProfileComplete == true {
                    if userManager.activeUser?.userType == UserType.coach {
                        CoachTabBar().environmentObject(userManager)
                    } else {
                        ContentView().environmentObject(userManager)
                    }
                } else {
                    NavigationView {
                        PersonalInfoView().environmentObject(userManager)
                            .navigationBarHidden(true)
                    }
                }
                
            }
            
        }
    }
}
