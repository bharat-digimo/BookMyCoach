//
//  Booking.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import Foundation

struct Booking: Codable {
    var id: Int
    var userId: Int
    var coach: User?
    var user: User?
    var responseDate: Date?
    var createdAt: Date?
    var sessionStartDateTime: Date?
    var sessionTime: String?
    var status: BookingStatus
    
    enum BookingStatus: String, Codable {
        case none
        case pending
        case accepted
        case active // payment is done
        case rejected
        case expired
    }
}

extension Booking {
    
    static func getMyBookings(_ handler: @escaping ([Booking], Error?) -> ()) {
        let service = APIService.getMyBookings
        service.fetchList(Booking.self) { (list, error, _) in
            handler(list ?? [], error)
        }
    }
    
    static func getPendingBookingRequestForCoach(_ handler: @escaping ([Booking], Error?) -> ()) {
        let service = APIService.pendingRequestForCoach
        service.fetchList(Booking.self) { (list, error, _) in
            handler(list ?? [], error)
        }
    }
    
    func acceptBooking(_ isAccept: Bool, handler: @escaping (Bool, Error?) -> ()) {
        let service = APIService.acceptBookingRequest(request: RespondBookingRequest(bookingId: self.id, isAccepted: isAccept))
        service.submit { (response) in
            handler(response.isSuccess, response.error)
        }
    }
    
}
