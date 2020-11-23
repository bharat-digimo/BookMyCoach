//
//  User.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var bio: String?
    var latitude: Double?
    var longitude: Double?
    var price: String?
    var type: UserType = UserType.player
    
    var rating: Float = 0.0
}

enum UserType: Int, Codable {
    case coach
    case player
}
