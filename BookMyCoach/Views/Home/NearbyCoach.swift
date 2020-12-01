//
//  NearbyCoach.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI
import KingfisherSwiftUI

struct NearbyCoach: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12)
    ]
    @State var coaches: [User] = []
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(coaches, id: \.id) { coach in
                CoachProfileCard(coach: coach)
            }
        }
        .foregroundColor(.white)
        .onAppear(perform: {
            User.nearbyCoach(NearbyCoachRequest(latitude: 0, longitude: 0)) { (list, error) in
                if error == nil {
                    coaches = list ?? []
                }
            }
        })
    }
}

struct NearbyCoach_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            NearbyCoach(coaches: [coach1, coach2, coach6, coach8, coach5])
        }
    }
}

struct CoachProfileCard: View {
    
    var coach: User
    let screen = UIScreen.main.bounds
    
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
                    Image(coach.sport?[0].icon ?? "")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(coach.sport?[0].name ?? "")
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
                Button(action: {}, label: {
                    Text("Book Now")
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

