//
//  NearbyCoach.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI
import KingfisherSwiftUI
import CoreLocation

struct NearbyCoach: View {
    
    var location: CLLocation?
    var coachBookingAction: ((User) -> ())?
    var coaches: [User]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12)
    ]
    
    init(location: CLLocation?, coaches: [User], coachBookingAction: ((User) -> ())?) {
        self.location = location
        self.coaches = coaches
        self.coachBookingAction = coachBookingAction
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(0..<coaches.count, id: \.self) { index in
                CoachProfileCard(coach: coaches[index], bookingAction: coachBookingAction)
            }
        }
        .foregroundColor(.white)
    }
}

struct NearbyCoach_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            NearbyCoach(location: nil, coaches: [user3], coachBookingAction: nil)
        }
    }
}

struct CoachProfileCard: View {
    
    var coach: User
    let screen = UIScreen.main.bounds
    var bookingAction: ((User) -> ())?
    
    var body: some View {
        HStack {
            ImageLoader(url: coach.profilePhoto, name: coach.fullName)
                .frame(width: screen.width / 3)
                .clipped()
            VStack(alignment: .leading, spacing: 8) {
                Text(coach.fullName ?? "")
                    .font(.title2)
                    .bold()
                    .padding(.top, 16)
                
                HStack {
                    Image(coach.userSports?.first?.sport?.icon ?? "")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(coach.userSports?.first?.sport?.name ?? "")
                }
                
                HStack(spacing: 8) {
                    Text("$")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.yellow)
                    Text(coach.price?.description ?? "0.0")
                        .bold()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading, 12)
                    Text("5.0")
                        .bold()
                }
                Spacer()
                Button(action: {
                    if coach.bookingStatus == .none {
                        bookingAction?(coach)
                    }
                }, label: {
                    Text(coach.bookingStatus == .none ? Constant.bookNow : coach.bookingStatus.rawValue.capitalized)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.title3)
                        .padding(.vertical, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                        )
                })
                .padding(.bottom, 16)
            }
            .padding(.horizontal)
            Spacer()
        }
        .background(Color.white.opacity(0.2))
        .foregroundColor(.white)
    }
    
}

