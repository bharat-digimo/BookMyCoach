//
//  BookMyCoachApp.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

@main
struct BookMyCoachApp: App {
    
    var user: User? = UserManager.shared.activeUser
    
    var body: some Scene {
        WindowGroup {
            if user == nil {
                LoginView()
            } else {
                if user?.isProfileComplete == true {
                    ContentView()
                } else {
                    NavigationView {
                        PersonalInfoView()
                            .navigationBarHidden(true)
                    }
                }
                
            }
            
        }
    }
}
