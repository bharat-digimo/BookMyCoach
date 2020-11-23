//
//  PlayerHome.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

struct PlayerHome: View {
    
    @State private var bookings: [Booking] = [booking1, booking2, booking3]
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderView()
                
                ScrollView {
                    Text("scroll view")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Text("horizontal scroll view")
                        }
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct PlayerHome_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PlayerHome()
        }
    }
}
