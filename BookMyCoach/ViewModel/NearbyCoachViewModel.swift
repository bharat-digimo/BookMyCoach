//
//  NearbyCoachViewModel.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 12/2/20.
//

import Foundation
import CoreLocation

class NearbyCoachViewModel: ObservableObject {
    
    @Published var coaches: [User] = []
    @Published var isShowLoader: Bool = false
        
    func updateCoachBooking(_ coachId: Int, booking: Booking) {
        var coach = coaches.filter({$0.id == coachId}).first
        coach?.bookings?.append(booking)
    }
    
    func getNearByCoaches(_ location: CLLocation?) {
        isShowLoader = true
        let user = UserManager.shared.activeUser
        User.nearbyCoach(NearbyCoachRequest(latitude: location?.latitude ?? user?.latitude ?? 0, longitude: location?.longitude ?? user?.longitude ?? 0)) { (list, error) in
            self.isShowLoader = false
            if error == nil {
                self.coaches = list ?? []
                print("Fetched nearby coaches", self.coaches.count, list?.count ?? 0)
            }
        }
    }
    
    func bookCoach(_ coach: User) {
        coach.bookCoach { (booking, error) in
            if let booking = booking {
                self.updateCoachBooking(coach.id, booking: booking)
            }
        }
    }
}
