//
//  CoachHome.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI

struct CoachHome: View {
    
    @State private var bookings: [Booking] = [booking1, booking2, booking3, booking4]
    @State private var sports: [Sport] = allSports
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView()
                ScrollView {
                    CardHeader(category: "Upcoming Session")
                        .padding(.horizontal)
                    SessionCardView(bookings: bookings)
                    CardHeader(category: "Recent Booking Invitations")
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 12))
                    RecentBooking(bookings: [booking5, booking8, booking9, booking10])
                    CardHeader(category: "Nearby Coaches")
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 12))
                    NearbyCoach(coaches: allCoaches)
                        .padding()
                }
            }
            .foregroundColor(.white)
            .background(Color.black)
        }
    }
}

struct CoachHome_Previews: PreviewProvider {
    static var previews: some View {
        CoachHome()
    }
}
