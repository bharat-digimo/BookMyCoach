//
//  HeaderView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

struct HeaderView: View {
    var locationName: String
    
    init(location: String) {
        self.locationName = location
    }
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                HStack(spacing: 10) {
                    Image(systemName: "map")
                        .font(.title)
                    
                    Text(locationName)
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                }
                .foregroundColor(.white)
            })
            Spacer()
            Button(action: {
                
            }, label: {
                HStack(spacing: 10) {
                    Image(systemName: "bell")
                        .font(.title)
                    
                    Text("")
                        .font(.title2)
                        .bold()
                }
                .foregroundColor(.white)
            })
            
        }
        .padding()
//        .background(Color.gray.opacity(0.5))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            HeaderView(location: "Current location")
        }
    }
}
