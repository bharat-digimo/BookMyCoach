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
        ScrollView(.horizontal, showsIndicators: false) {
            if bookings.count == 0 {
                Text("No booking available for you.")
            } else {
                TabView {
                    ForEach(bookings, id: \.id) { booking in
                        ZStack {
                            Color.white.opacity(0.2)
                            VStack {
                                CoachProfileView(booking: booking, shouldShowRating: true)
                                Color.gray.frame(height: CGFloat(1) / UIScreen.main.scale)
                                HStack {
                                    ContentLabel(labelName: "Booking Date", value: "24th March, 2020")
                                    Spacer()
                                    ContentLabel(labelName: "Session Time", value: "09:00 AM")
                                }
                                .padding()
                                Spacer()
                            }
                        }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    }
                    .padding(.all, 10)
                }
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .foregroundColor(.white)
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
    let shouldShowRating: Bool
    
    var body: some View {
        LazyVStack {
            HStack {
                KFImage(URL(string: booking.coach.profilePhoto ?? ""))
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .aspectRatio(contentMode: .fill)
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

struct ContentLabel: View {
    
    var labelName: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(labelName)
                .foregroundColor(Color.white.opacity(0.6))
            Text(value)
        }
    }
    
}
