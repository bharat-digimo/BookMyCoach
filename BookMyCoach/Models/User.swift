//
//  User.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import Foundation

struct User {
    var id: Int
    var name: String
    var profilePhoto: String
    var bio: String?
    var latitude: Double?
    var longitude: Double?
    var price: Double?
    var type: UserType = UserType.player
    
    var rating: Float = 0.0
}

enum UserType: Int {
    case coach
    case player
}
