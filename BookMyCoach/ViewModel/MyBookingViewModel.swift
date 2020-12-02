//
//  MyBookingViewModel.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 12/2/20.
//

import Foundation

class MyBookingViewModel: ObservableObject {
    
    @Published var myBookings: [Booking] = []
    @Published var isShowLoader: Bool = false
    
    func getMyBookings() {
        isShowLoader = true
        Booking.getMyBookings { (list, error) in
            self.isShowLoader = false
            if error == nil {
                self.myBookings = list
            }
        }
    }
    
    
}
