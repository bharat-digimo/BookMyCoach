//
//  SportsList.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 24/11/20.
//

import SwiftUI

struct SportsList: View {
    
    var sports: [Sport]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    VStack(spacing: 12) {
                        ZStack {
                            Color.white.opacity(0.5)
                            Image(sport.icon)
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
                        Text(sport.name)
                    }
                    .padding()
                }
            }
        }
    }
}

struct SportsList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SportsList(sports: allSports)
        }
        .foregroundColor(.white)
    }
}
