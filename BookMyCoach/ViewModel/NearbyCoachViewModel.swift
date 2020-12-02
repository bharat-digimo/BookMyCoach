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
    
    func getNearByCoaches(_ location: CLLocation?) {
        isShowLoader = true
        let user = UserManager.shared.activeUser
        User.nearbyCoach(NearbyCoachRequest(latitude: location?.latitude ?? user?.latitude ?? 0, longitude: location?.longitude ?? user?.longitude ?? 0)) { (list, error) in
            self.isShowLoader = false
            if error == nil {
                self.coaches = (list ?? []).filter({$0.bookingStatus == .none})
                print("Fetched nearby coaches", self.coaches.count, list?.count ?? 0)
            }
        }
    }
    
    func bookCoach(_ coach: User, handler: @escaping () -> ()) {
        coaches.removeAll { (item) -> Bool in
            return item.id == coach.id
        }
        coach.bookCoach { (booking, error) in
            handler()
        }
    }
}
