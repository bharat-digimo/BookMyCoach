//
//  NearbyCoach.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI
import KingfisherSwiftUI

struct NearbyCoach: View {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var coaches: [User]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(coaches, id: \.id) { coach in
                CoachProfileCard(coach: coach)
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
            NearbyCoach(coaches: [coach1, coach2])
        }
    }
}

struct CoachProfileCard: View {
    
    var coach: User
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                KFImage(URL(string: coach.profilePhoto))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
            }
            .padding(.all, 2)
            VStack {
                HStack(spacing: 2) {
                    Text("$")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.yellow)
                    Text(coach.price?.description ?? "0.0")
                        .bold()
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(coach.rating.description)
                        .bold()
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]), startPoint: .top, endPoint: .bottom))
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                        Text(coach.name)
                            .bold()
                            .lineLimit(1)
                            .font(.title3)
                        HStack {
                            Image(coach.sport[0].icon)
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 15, height: 15)
                            Text(coach.sport[0].name)
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(Color.black.opacity(0.6))
                        }
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 8, trailing: 8))
                .background(Color.white)
                .foregroundColor(.black)
            }
        }.cornerRadius(20)
    }
}
