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
    @State private var showContentView: Bool = false
    
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
                        ForEach(0..<viewModels.count, id:\.self) { index in
                            let vm = viewModels[index]
                            let sport = vm.sport
                            HStack {
                                Image(sport.icon)
                                    .padding(.horizontal, 12)
                                Text(sport.name)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                self.image(for: vm.isSelected)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .onTapGesture {
                                vm.isSelected.toggle()
                            }
                            .padding()
                        }
                    }
                }
                RoundedButton(text: "Next") {
                    showContentView = true
                }
            }
            .fullScreenCover(isPresented: $showContentView, content: {
                ContentView()
            })
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
