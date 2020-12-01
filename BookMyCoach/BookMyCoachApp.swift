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
                    ContentView().environmentObject(userManager)
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
