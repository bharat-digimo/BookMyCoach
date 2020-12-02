//
//  PlayerHome.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI
import ActivityIndicatorView

struct PlayerHome: View {
    
    @ObservedObject var bookingVM = MyBookingViewModel()
    @ObservedObject var nearbyCoachesVM = NearbyCoachViewModel()
    @State private var bookings: [Booking] = [booking1, booking2, booking3, booking4]
    @State private var sports: [Sport] = allSports
    @State private var showLoading = false
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(location: locationManager.placemark?.locality ?? Constant.noLocation)
                ScrollView {
                    CardHeader(category: Constant.yourCoach)
                        .padding(.horizontal)
                    CardView(bookings: bookingVM.myBookings)
                    CardHeader(category: Constant.allSports)
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 12))
                    SportsList(sports: sports)
                    CardHeader(category: Constant.nearbyCoaches)
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 12))
                    NearbyCoach(location: locationManager.location, coaches: nearbyCoachesVM.coaches, coachBookingAction: { (coach) in
                        nearbyCoachesVM.bookCoach(coach) {
                            bookingVM.getMyBookings()
                        }
                    })
                        .padding()
                }
            }
            .foregroundColor(.white)
            .background(Color.black)
            
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
        }
        .onAppear {
            bookingVM.getMyBookings()
            nearbyCoachesVM.getNearByCoaches(locationManager.location)
        }
    }
    
}

struct PlayerHome_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHome()
    }
}


struct CardHeader: View {
    
    var category: String
    
    var body: some View {
        HStack() {
            Text(category)
                .bold()
                .font(.title2)
            Spacer()
        }
    }
}
