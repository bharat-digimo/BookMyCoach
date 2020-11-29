//
//  SportsListView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct SportsListView: View {
    
    var viewModels: [SportViewModel] = allSports.map({ SportViewModel(sport: $0) })
    @State private var navBarHidden: Bool = true
    func image(for state: Bool) -> Image {
        return state ? Image(systemName: "checkmark.circle") : Image(systemName: "circle")
    }
    
    var body: some View {
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Choose your sports.")
                        .font(.system(size: 42, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                        .padding()

                    Spacer()
                }
                
                ScrollView {
                    VStack() {
                        ForEach(allSports, id:\.self) { sport in
                            HStack {
                                Image(sport.icon)
                                    .padding(.horizontal, 12)
                                Text(sport.name)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                self.image(for: true)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .padding()
                                    .onTapGesture {
                                    //
                                }
                            }
                            .padding()
                        }
                    }
                }
                RoundedButton(text: "Next")
            }
        }
        .navigationTitle("")
        .navigationBarHidden(navBarHidden)
    }
}

struct SportsListView_Previews: PreviewProvider {
    static var previews: some View {
        SportsListView()
    }
}
