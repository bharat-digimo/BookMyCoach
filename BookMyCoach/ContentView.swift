//
//  ContentView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        
//        UITabBar.appearance().isTranslucent = false
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
            
            ProfileView(user: user1)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
