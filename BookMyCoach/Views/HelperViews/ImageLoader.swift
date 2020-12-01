//
//  ImageLoader.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 12/1/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ImageLoader: View {
    
    var url: String?
    var name: String?
    
    var body: some View {
        
        let initials = name?.getInitials() ?? "IMAGE"
        
        if let urlString = url, urlString.count > 0 {
            KFImage(URL(string: urlString))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        } else {
            ZStack {
                Color(initials.pickColor())
                Text(initials)
                    .font(.title2)
                    .bold()
            }
        }
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoader(url: "")
    }
}
