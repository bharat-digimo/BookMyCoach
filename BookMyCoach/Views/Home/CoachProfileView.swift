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
                ImageLoader(url: booking.coach?.profilePhoto, name: booking.coach?.fullName)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                VStack(alignment: .leading) {
                    Text(booking.coach?.fullName ?? "")
                        .font(.title2)
                        .bold()
                    Text(booking.coach?.userSports?.first?.sport?.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.7))
                    Text(booking.status.rawValue.uppercased())
                        .font(.caption2)
                        .padding(.all, 4)
                        .padding(.horizontal, 8)
                        .background(Color.yellow.opacity(0.6))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                .padding(.leading, 8)
                Spacer()
                if shouldShowRating {
                    HStack(alignment: .top) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(booking.coach?.rating?.description ?? "5.0")
                            .bold()
                    }
                }
            }
        }.padding()
    }
}

struct CoachProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            CoachProfileView(booking: booking5, shouldShowRating: true)
        }
    }
}
