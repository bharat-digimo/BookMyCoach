//
//  PersonalInfoView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI
import ActivityIndicatorView
 
struct PersonalInfoView: View {
    
    enum ViewType {
        case create
        case edit
    }
    
    @EnvironmentObject var userManager: UserManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var hourlyRate: String?
    @State var showImagePicker: Bool = false
    @State var pickedImage: UIImage? = nil
    @State private var navBarHidden: Bool = true
    @State private var showSportsList: Bool = false
    @State private var showsAlert = false
    @State private var alertMessage = ""
    @State private var showLoading = false
    
    var viewType: ViewType = .create
    var titleText = ""
    
    init(viewType: ViewType = .create) {
        self.viewType = viewType
        if viewType == .edit {
            self._navBarHidden = State(wrappedValue: self.viewType == .create)
            self.titleText = "Edit profile"
        }
    }
    
    var body: some View {
        let user = userManager.activeUser
        
        let fullName = Binding<String> {
            return userManager.activeUser?.fullName ?? ""
        } set: { newVal in
            userManager.activeUser?.fullName = newVal
        }
        
        let hourlyRate = Binding<String> {
            return self.hourlyRate ?? userManager.activeUser?.price?.description ?? ""
        } set: {
            self.hourlyRate = $0
            userManager.activeUser?.price = Double($0)
        }
        
        let bio = Binding<String> {
            return userManager.activeUser?.bio ?? ""
        } set: { newVal in
            userManager.activeUser?.bio = newVal
        }
        
        ZStack {
            Color.themeBackground.edgesIgnoringSafeArea(.all)
            VStack {
                if viewType == .create {
                    HStack {
                        Text("Tell us more about you.")
                            .font(.system(size: 42, weight: .bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
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
                                                
                        LoginTextField(text: fullName, placeholder: "Full Name", imageName: "person")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        if user?.userType == .coach {
                            LoginTextField(text: hourlyRate, placeholder: "Hourly Rate", imageName: "dollarsign.circle")
                                .keyboardType(.numberPad)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        }
                        
                        LoginTextField(text: bio, placeholder: "About you", imageName: "highlighter")
                            .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 40)
                        NavigationLink(destination: SportsListView(), isActive: $showSportsList) { EmptyView() }
                        RoundedButton(text: viewType == .create ? "Next" : "Update") {
                            nextTapped()
                        }
                    }
                    .padding(.top, 20)
                }
            }
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
        let user = userManager.activeUser
        if user?.fullName?.isEmpty == true {
            alertMessage = "Please enter your full name."
            showsAlert = true
        }  else if user?.bio?.isEmpty == true {
            alertMessage = "About me cannot be blank."
            showsAlert = true
        } else {
            if user?.userType == UserType.coach {
                if user?.price?.description.isEmpty == true {
                    alertMessage = "Please enter your hourly rate."
                    showsAlert = true
                    return
                } else if user?.price ?? 0.0 == 0.0 {
                    alertMessage = "Hourly rate should be greater than 0."
                    showsAlert = true
                    return
                }
            }
            hideKeyboard()
            showLoading = true
            user?.update(UserUpdateRequest(fullName: user?.fullName ?? "", bio: user?.bio, price: user?.price, latitude: 0.0, longitude: 0.0, profilePhoto: nil), handler: { (user, error) in
                showLoading = false
                if error == nil, let user = user {
                    UserManager.shared.activeUser = user
                    if viewType == .create {
                        showSportsList = true
                    } else {
                        self.mode.wrappedValue.dismiss()
                    }
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
        PersonalInfoView()
    }
}
