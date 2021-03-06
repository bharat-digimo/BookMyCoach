//
//  RecentBooking.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI

struct RecentBooking: View {
    
    var bookings: [Booking]
    var acceptBookingAction: ((Booking, Bool) -> ())?
    
    var body: some View {
        if bookings.count == 0 {
            ZStack {
                Color.white.opacity(0.2)
                HStack {
                    Spacer()
                    Text(Constant.noRecentBookingAvailable)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.vertical, 50)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(bookings, id: \.id) { booking in
                        BookingInvitationCard(booking: booking, acceptBookingAction: acceptBookingAction)
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct RecentBooking_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            RecentBooking(bookings: [booking5, booking6, booking7, booking8])
        }
    }
}

struct BookingInvitationCard: View {
    
    var booking: Booking
    var acceptBookingAction: ((Booking, Bool) -> ())?
    
    var body: some View {
        LazyVStack {
            HStack {
                ImageLoader(url: booking.coach?.profilePhoto, name: booking.coach?.fullName)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                VStack(alignment: .leading) {
                    Text(booking.coach?.fullName ?? "")
                        .font(.title2)
                        .bold()
                    Text("24th Nov, 2020 at 09:30 AM")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.7))
                }
                .padding(.leading, 8)
                Spacer()
                HStack(alignment: .top, spacing: 20) {
                    Button(action: {
                        acceptBookingAction?(booking, true)
                    }, label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .foregroundColor(.green)
                    })
                    Button(action: {
                        acceptBookingAction?(booking, false)
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.title)
                            .foregroundColor(.red)
                    })
                }
            }
        }.padding()
    }
    
}
