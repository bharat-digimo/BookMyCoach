//
//  CoachHome.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI

struct CoachHome: View {
    
    @ObservedObject var bookingVM = MyBookingViewModel()
    @ObservedObject var locationManager = LocationManager()
    @State private var sports: [Sport] = allSports
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(location: locationManager.placemark?.locality ?? Constant.noLocation)
                ScrollView {
                    CardHeader(category: Constant.upcomingSession)
                        .padding(.horizontal)
                    SessionCardView(bookings: bookingVM.myBookings)
                    CardHeader(category: Constant.recentBookingInvitation)
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 12))
                    RecentBooking(bookings: bookingVM.pendingRequests) { (booking, isAccept) in
                        bookingVM.acceptBooking(booking, isAccept: isAccept)
                    }
                }
            }
            .foregroundColor(.white)
            .background(Color.black)
        }
        .onAppear(perform: {
            bookingVM.getMyBookings()
            bookingVM.getMyPendingBookings()
        })
    }
    
}

struct CoachHome_Previews: PreviewProvider {
    static var previews: some View {
        CoachHome()
    }
}
