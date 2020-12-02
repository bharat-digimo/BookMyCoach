//
//  SessionCardView.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI

struct SessionCardView: View {
    
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
                            Color.gray.opacity(0.5)
                            VStack {
                                CoachProfileView(booking: booking, shouldShowRating: false)
                                Color.gray.frame(height: CGFloat(1) / UIScreen.main.scale)
                                HStack {
                                    ContentLabel(labelName: Constant.bookingDate, value: booking.createdAt?.format(Date.Format.yyyyMMddhhmma) ?? "")
                                    Spacer()
                                    ContentLabel(labelName: Constant.sessionTime, value: booking.createdAt?.format(Date.Format.hhmma) ?? "")
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

struct SessionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SessionCardView(bookings: [booking1, booking2, booking3])
        }
    }
}
