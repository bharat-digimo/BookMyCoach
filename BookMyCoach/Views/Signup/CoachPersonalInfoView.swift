//
//  CoachPersonalInfoView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI

struct CoachPersonalInfoView: View {
    @State private var fullName: String = ""
    @State private var hourlyRate: String = ""
    @State private var bio: String = ""
    @State var showImagePicker: Bool = false
    @State var pickedImage: UIImage? = nil
    @State private var navBarHidden: Bool = true
    @State private var showSportsList: Bool = false
    @State private var showsAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Tell us more about you.")
                        .font(.system(size: 42, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                
                ScrollView {
                    VStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(Color.buttonBackground)
                                    .frame(width: 150, height: 150)
                                Image(systemName: "camera")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(.buttonBackground)
                            }
                            Text("Choose a profile photo (Optional)")
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        
                        LoginTextField(text: $fullName, placeholder: "Full Name", imageName: "person")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        LoginTextField(text: $hourlyRate, placeholder: "Hourly Rate", imageName: "dollarsign.circle")
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        LoginTextField(text: $bio, placeholder: "About you", imageName: "highlighter")
                            .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 40)
                        NavigationLink(destination: SportsListView(), isActive: $showSportsList) { EmptyView() }
                        RoundedButton(text: "Next") {
                            nextTapped()
                        }
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(navBarHidden)
        .alert(isPresented: $showsAlert, content: {
            Alert(title: Text(alertMessage))
        })
    }
    
    private func nextTapped() {
        if fullName.isEmpty {
            alertMessage = "Please enter your full name."
            showsAlert = true
        } else if hourlyRate.isEmpty {
            alertMessage = "Please enter your hourly rate."
            showsAlert = true
        } else if Double(hourlyRate) ?? 0.0 == 0.0 {
            alertMessage = "Hourly rate should be greater then 0."
            showsAlert = true
        } else if bio.isEmpty {
            alertMessage = "About me cannot be blank."
            showsAlert = true
        } else {
            showSportsList = true
        }
    }
}

struct CoachPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CoachPersonalInfoView()
    }
}
