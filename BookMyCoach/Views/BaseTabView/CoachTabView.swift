//
//  CoachTabView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 24/11/20.
//

import SwiftUI

struct CoachTabView: View {
    
    var body: some View {
        TabView {
            CoachHome()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(0)
            
            Text("Member")
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Member")
                    }
                }
                .tag(1)
            
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

struct CoachTabView_Previews: PreviewProvider {
    static var previews: some View {
        CoachTabView()
    }
}
