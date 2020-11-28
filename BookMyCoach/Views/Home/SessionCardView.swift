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
        ScrollView(.horizontal, showsIndicators: false) {
            if bookings.count == 0 {
                Text("No booking available for you.")
            } else {
                TabView {
                    ForEach(bookings, id: \.id) { booking in
                        ZStack {
                            Color.gray.opacity(0.5)
                            VStack {
                                CoachProfileView(booking: booking, shouldShowRating: false)
                                Color.gray.frame(height: CGFloat(1) / UIScreen.main.scale)
                                HStack {
                                    ContentLabel(labelName: "Session Date", value: "24th March, 2020")
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

struct SessionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SessionCardView(bookings: [booking1, booking2, booking3])
        }
    }
}
