//
//  CardView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

struct CardView: View {
    
    var bookings: [Booking]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        if bookings.count == 0 {
            ZStack {
                Color.white.opacity(0.2)
                HStack {
                    Spacer()
                    Text(Constant.noBookingAvailable)
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
            ScrollView(.horizontal, showsIndicators: false) {
                TabView {
                    ForEach(bookings, id: \.id) { booking in
                        ZStack {
                            Color.white.opacity(0.2)
                            VStack {
                                CoachProfileView(booking: booking, shouldShowRating: true)
                                Color.gray.frame(height: CGFloat(1) / UIScreen.main.scale)
                                HStack {
                                    ContentLabel(labelName: Constant.bookingDate, value: booking.createdAt?.format(Date.Format.yyyyMMddhhmma) ?? "")
                                    Spacer()
                                    ContentLabel(labelName: Constant.sessionTime, value: booking.sessionStartDateTime?.format(Date.Format.hhmma) ?? "")
                                }
                                .padding()
                                Spacer()
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    }
                    .padding(.all, 10)
                }
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
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
            CardView(bookings: [])
        }
        .foregroundColor(.white)
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
