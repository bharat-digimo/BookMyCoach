//
//  ProfileView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/24/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ProfileView: View {

    var user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    VStack {
                        HStack {
                            HStack(alignment: .top) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(user.rating?.description ?? "5.0")
                                    .bold()
                            }
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "gearshape")
                                    .foregroundColor(.white)
                                    .font(.title)
                            })
                        }
                        .padding()
                        Spacer()
                    }
                    VStack(spacing: 12) {
                        Spacer()
                        KFImage(URL(string: user.profilePhoto ?? ""))
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 200, height: 200)
                            .aspectRatio(contentMode: .fill)
                            .overlay(Circle().stroke(Color.white, lineWidth: 3.0))
                            .padding()
                        Text(user.fullName)
                            .font(.title)
                            .bold()
                        HStack {
                            Image(user.sport?[0].icon ?? "")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text(user.sport?[0].name ?? "")
                                .font(.title3)
                        }
                        Spacer()
                    }
                }
                .frame(height: 360)
                Color.white.frame(height: CGFloat(1) / UIScreen.main.scale)
                VStack(spacing: 16) {
                    ContentLabel(labelName: "About Me", value: user.bio ?? "")
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }.foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ProfileView(user: user1)
        }
    }
}
