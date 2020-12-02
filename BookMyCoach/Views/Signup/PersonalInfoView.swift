//
//  PersonalInfoView.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import SwiftUI
import ActivityIndicatorView
 
enum ViewType {
    case create
    case edit
}

struct PersonalInfoView: View {
        
    @EnvironmentObject var userManager: UserManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var locationManager = LocationManager()
    
    @State var hourlyRate: String?
    @State private var navBarHidden: Bool = true
    @State private var showSportsList: Bool = false
    @State private var showsAlert = false
    @State private var alertMessage = ""
    @State private var showLoading = false
    @State private var showPlayerDashboard = false
    
    @State private var image: Image?
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionSheet = false
    @State private var shouldPresentCamera = false
    
    var viewType: ViewType = .create
    var titleText = ""
    
    init(viewType: ViewType = .create) {
        self.viewType = viewType
        if viewType == .edit {
            self._navBarHidden = State(wrappedValue: self.viewType == .create)
            self.titleText = Constant.editProfile
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
                        Text(Constant.tellUSMore)
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
                                if let newImage = image {
                                    newImage
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(75)
                                    Circle()
                                        .stroke(Color.white)
                                        .frame(width: 150, height: 150)
                                } else if let imageUrl = userManager.activeUser?.profilePhoto, imageUrl.count > 0 {
                                    ImageLoader(url: imageUrl, name: userManager.activeUser?.fullName)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                        .cornerRadius(75)
                                } else {
                                    Image(systemName: "camera")
                                        .font(.system(size: 48, weight: .bold))
                                        .foregroundColor(.buttonBackground)
                                    Circle()
                                        .stroke(Color.buttonBackground)
                                        .frame(width: 150, height: 150)
                                }
                            }
                            .onTapGesture { self.shouldPresentActionSheet = true }
                            .sheet(isPresented: $shouldPresentImagePicker) {
                                ImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                            }.actionSheet(isPresented: $shouldPresentActionSheet) { () -> ActionSheet in
                                ActionSheet(title: Text(Constant.chooseMode), message: Text(Constant.chooseModeMessage), buttons: [ActionSheet.Button.default(Text(Constant.camera), action: {
                                    self.shouldPresentImagePicker = true
                                    self.shouldPresentCamera = true
                                }), ActionSheet.Button.default(Text(Constant.photoLibrary), action: {
                                    self.shouldPresentImagePicker = true
                                    self.shouldPresentCamera = false
                                }), ActionSheet.Button.cancel()])
                            }
                            Text(Constant.chooseProfilePic)
                                .foregroundColor(.white)
                                .padding(.leading)
                        }.padding(.horizontal)
                                                
                        LoginTextField(text: fullName, placeholder: Constant.fullName, imageName: "person")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        if user?.userType == .coach {
                            LoginTextField(text: hourlyRate, placeholder: Constant.hourlyRate, imageName: "dollarsign.circle")
                                .keyboardType(.numberPad)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        }
                        
                        LoginTextField(text: bio, placeholder: Constant.aboutYou, imageName: "highlighter")
                            .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 40)
                        NavigationLink(destination: SportsListView(), isActive: $showSportsList) { EmptyView() }
                        RoundedButton(text: viewType == .create ? Constant.next : Constant.update) {
                            nextTapped()
                        }
                    }
                    .padding(.top, 20)
                }
            }
            ActivityIndicatorView(isVisible: $showLoading, type: .scalingDots)
                .frame(width: 100, height: 100)
        }
        .fullScreenCover(isPresented: $showPlayerDashboard, content: {
            PlayerTabView()
        })
        .navigationTitle(titleText)
        .navigationBarHidden(navBarHidden)
        .alert(isPresented: $showsAlert, content: {
            Alert(title: Text(alertMessage))
        })
    }
    
    private func uploadImage() {
        if let newImage = self.image {
            newImage.asUIImage { (uiImage) in
                StorageManager.uploadImage(uiImage, folder: .Profile) { (url, error) in
                    if let urlString = url?.absoluteString {
                        userManager.activeUser?.profilePhoto = urlString
                    }
                    updateProfile()
                }
            }
        } else {
            updateProfile()
        }
    }
    
    private func updateProfile() {
        guard let lat = locationManager.location?.latitude, let long = locationManager.location?.longitude else {
            alertMessage = Constant.locationRequired
            showsAlert = true
            return
        }
        let user = userManager.activeUser
        user?.update(UserUpdateRequest(fullName: user?.fullName ?? "", bio: user?.bio, price: user?.price, latitude: lat, longitude: long, profilePhoto: user?.profilePhoto), handler: { (user, error) in
            showLoading = false
            if error == nil, let user = user {
                UserManager.shared.activeUser = user
                if viewType == .create {
                    if user.userType == UserType.player {
                        showPlayerDashboard = true
                    } else {
                        showSportsList = true
                    }
                } else {
                    self.mode.wrappedValue.dismiss()
                }
            } else {
                alertMessage = error?.localizedDescription ?? Constant.somethingWentWrong
                showsAlert = true
            }
        })
    }
    
    private func nextTapped() {
        let user = userManager.activeUser
        if user?.fullName?.isEmpty == true {
            alertMessage = Constant.enterFullName
            showsAlert = true
        }  else if user?.bio?.isEmpty == true {
            alertMessage = Constant.enterAboutMe
            showsAlert = true
        } else {
            if user?.userType == UserType.coach {
                if user?.price?.description.isEmpty == true {
                    alertMessage = Constant.enterHourlyRate
                    showsAlert = true
                    return
                } else if user?.price ?? 0.0 == 0.0 {
                    alertMessage = Constant.nonZeroHourlyRate
                    showsAlert = true
                    return
                }
            }
            hideKeyboard()
            showLoading = true
            uploadImage()
        }
    }
}

struct CoachPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
