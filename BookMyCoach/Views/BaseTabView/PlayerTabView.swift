//
//  PlayerTabView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

struct PlayerTabView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView {
            PlayerHome()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(0)
            
            Text("Chat")
                .tabItem {
                    VStack {
                        Image(systemName: "message.fill")
                        Text("Chat")
                    }
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }
                .tag(0)
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
    }
}

struct PlayerTabView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTabView()
    }
}
