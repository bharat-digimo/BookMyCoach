//
//  CoachPersonalInfoView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI
import ActivityIndicatorView

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
    @State private var showLoading = false
    
    var user = UserManager.shared.activeUser
    
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
                        }.padding(.horizontal)
                        
                        LoginTextField(text: $fullName, placeholder: "Full Name", imageName: "person")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        if let aUser = self.user, aUser.userType == .coach {
                            LoginTextField(text: $hourlyRate, placeholder: "Hourly Rate", imageName: "dollarsign.circle")
                                .keyboardType(.numberPad)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        }
                        
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
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
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
        }  else if bio.isEmpty {
            alertMessage = "About me cannot be blank."
            showsAlert = true
        } else {
            if user?.userType == .coach {
                 if hourlyRate.isEmpty {
                    alertMessage = "Please enter your hourly rate."
                    showsAlert = true
                    return
                } else if Double(hourlyRate) ?? 0.0 == 0.0 {
                    alertMessage = "Hourly rate should be greater than 0."
                    showsAlert = true
                    return
                }
            }
            hideKeyboard()
            showLoading = true
            user?.update(UserUpdateRequest(fullName: fullName, bio: bio, price: Double(hourlyRate), latitude: 0.0, longitude: 0.0, profilePhoto: nil), handler: { (user, error) in
                showLoading = false
                if error == nil {
                    UserManager.shared.activeUser = user
                    showSportsList = true
                } else {
                    alertMessage = error?.localizedDescription ?? "Something went wrong!!"
                    showsAlert = true
                }
            })
        }
    }
}

struct CoachPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CoachPersonalInfoView()
    }
}
