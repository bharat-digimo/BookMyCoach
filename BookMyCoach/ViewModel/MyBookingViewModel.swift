//
//  MyBookingViewModel.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 12/2/20.
//

import Foundation

class MyBookingViewModel: ObservableObject {
    
    @Published var myBookings: [Booking] = []
    @Published var pendingRequests: [Booking] = []
    @Published var isShowLoader: Bool = false
    
    func getMyBookings() {
        isShowLoader = true
        Booking.getMyBookings { (list, error) in
            self.isShowLoader = false
            if error == nil {
                if UserManager.shared.activeUser?.userType == UserType.coach {
                    self.myBookings = list.filter({$0.status == .active})
                } else {
                    self.myBookings = list
                }
            }
        }
    }
    
    func getMyPendingBookings() {
        isShowLoader = true
        Booking.getPendingBookingRequestForCoach { (list, error) in
            if error == nil {
                self.pendingRequests = list.filter({$0.status == .pending})
            }
        }
    }
    
    func acceptBooking(_ booking: Booking, isAccept: Bool) {
        self.pendingRequests.removeAll { (item) -> Bool in
            return item.id == booking.id
        }
        booking.acceptBooking(isAccept) { (success, _) in
            if success == true {
                self.getMyBookings()
            }
        }
    }
    
}
