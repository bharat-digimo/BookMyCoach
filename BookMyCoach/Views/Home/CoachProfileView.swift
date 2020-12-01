//
//  CoachProfileView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 12/1/20.
//

import SwiftUI

struct CoachProfileView: View {
    
    let screen = UIScreen.main.bounds
    let booking: Booking
    let shouldShowRating: Bool
    
    var body: some View {
        LazyVStack {
            HStack {
                ImageLoader(url: booking.coach.profilePhoto, name: booking.coach.fullName)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                VStack(alignment: .leading) {
                    Text(booking.coach.fullName ?? "")
                        .font(.title2)
                        .bold()
                    Text("Basket Ball")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.7))
                }
                .padding(.leading, 8)
                Spacer()
                if shouldShowRating {
                    HStack(alignment: .top) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(booking.coach.rating?.description ?? "5.0")
                            .bold()
                    }
                }
            }
        }.padding()
    }
}
