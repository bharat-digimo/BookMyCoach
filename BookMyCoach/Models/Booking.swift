//
//  Booking.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import Foundation

struct Booking {
    var id: Int
    var userId: Int
    var coach: User
    var bookingDate: Date?
    var sessionTime: String?
    
}
