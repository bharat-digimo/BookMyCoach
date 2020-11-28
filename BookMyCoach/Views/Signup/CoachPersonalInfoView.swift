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
    
    var body: some View {
        NavigationView {
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

                            //                    TextEditor(text: $bio)
                            LoginTextField(text: $bio, placeholder: "Bio", imageName: "highlighter")
                                .padding(.horizontal, 20)

                            Spacer().frame(height: 40)
                            RoundedButton(text: "Next") {
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(navBarHidden)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                self.navBarHidden = true
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                self.navBarHidden = false
            })
        }
        .navigationTitle("")
        .navigationBarHidden(navBarHidden)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
            self.navBarHidden = true
        })
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
            self.navBarHidden = false
        })
    }
}

struct CoachPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CoachPersonalInfoView()
    }
}
