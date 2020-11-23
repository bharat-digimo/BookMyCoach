//
//  CardView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI
import KingfisherSwiftUI

struct CardView: View {
    var bookings: [Booking]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        if bookings.count == 0 {
            Text("No booking available for you.")
        } else {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(bookings, id: \.id) { booking in
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.gray, lineWidth: 2)
                                    .frame(height: 180)
                                    .background(Color.gray.opacity(0.5))
                                
                                VStack {
                                    CoachProfileView(booking: booking)
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .background(Color.gray.opacity(0.5))
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Booking Date")
                                                .foregroundColor(Color.white.opacity(0.7))
                                            Text(booking.bookingDate?.description ?? "")
                                                .bold()
                                        }
                                        Spacer()
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Session Time")
                                                .foregroundColor(Color.white.opacity(0.7))
                                            Text(booking.sessionTime ?? "")
                                                .bold()
                                        }
                                    }
                                    .padding()
                                }
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CardView(bookings: [booking1, booking2, booking3])
        }
    }
}

struct CoachProfileView: View {
    
    let screen = UIScreen.main.bounds
    let booking: Booking
    
    var body: some View {
        HStack(spacing: 20) {
            KFImage(URL(string: booking.coach.profilePhoto))
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
            VStack(alignment: .leading) {
                Text(booking.coach.name)
                    .bold()
                    .lineLimit(1)
                    .font(.title2)
                Text("Basket Ball")
            }
            Spacer()
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(booking.coach.rating.description)
                        .bold()
                        .font(.title3)
                }
                Spacer()
            }
        }
        .padding()
        .frame(width: screen.width, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}
