//
//  SportsListView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI
import ActivityIndicatorView

struct SportsListView: View {
        
    let sports = allSports
    
    @EnvironmentObject var userManager: UserManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var navBarHidden: Bool = true
    @State private var showContentView: Bool = false
    @State private var selectedSport: Sport? = nil
    @State private var showsAlert = false
    @State private var alertMessage = ""
    @State private var showLoading = false
    
    var viewType: ViewType = .create
    var titleText = ""
    
    init(viewType: ViewType = .create, oldSport: Sport? = nil) {
        self.viewType = viewType
        self.selectedSport = oldSport
        if viewType == .edit {
            self._navBarHidden = State(wrappedValue: self.viewType == .create)
            self.titleText = "Update Sports"
        }
    }
    
    func image(for sport: Sport) -> Image {
        let sportId = selectedSport?.id ?? userManager.activeUser?.userSports?.first?.sport?.id
        if sportId == sport.id {
            return Image(systemName: "checkmark.circle")
        }
        return Image(systemName: "circle")
    }
    
    var body: some View {
        ZStack {
            if viewType == .create {
                Color.themeBackground.edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                if viewType == .create {
                    HStack {
                        Text(Constant.chooseSports)
                            .font(.system(size: 42, weight: .bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                }
                
                ScrollView {
                    VStack() {
                        ForEach(0..<sports.count, id:\.self) { index in
                            let sport = sports[index]
                            HStack {
                                Image(sport.icon)
                                    .padding(.horizontal, 12)
                                Text(sport.name)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                self.image(for: sport)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedSport = sport
                                }
                            }
                            .padding()
                        }
                    }
                }
                RoundedButton(text: viewType == .create ? Constant.next : Constant.update) {
                   nextTapped()
                }
                .padding()
            }
            .fullScreenCover(isPresented: $showContentView, content: {
                CoachTabView()
            })
            
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
            
        }
        .navigationTitle(titleText)
        .navigationBarHidden(navBarHidden)
        .alert(isPresented: $showsAlert, content: {
            Alert(title: Text(alertMessage))
        })
    }
    
    private func nextTapped() {
        if let sport = selectedSport {
            showLoading = true
            UserManager.shared.activeUser?.updateSport(sport, { (success, error) in
                showLoading = false
                if success {
                    if viewType == .create {
                        showContentView = true
                    } else {
                        self.mode.wrappedValue.dismiss()
                    }
                } else {
                    alertMessage = error?.localizedDescription ?? Constant.somethingWentWrong
                    showsAlert = true
                }
            })
        } else {
            alertMessage = Constant.chooseSportToProceed
            showsAlert = true
        }
    }
}

struct SportsListView_Previews: PreviewProvider {
    static var previews: some View {
        SportsListView()
    }
}
