//
//  User.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import Foundation

struct User: Codable {
    var id: Int
    var fullName: String?
    var email: String
    var profilePhoto: String?
    var bio: String?
    var latitude: Double?
    var longitude: Double?
    var price: Double?
    var userType: UserType = UserType.player
    var sport: [Sport]?
    var rating: Float? = 0.0
    var isProfileComplete: Bool? = false
}

enum UserType: String, Codable {
    case coach
    case player
}

// Service Layer
extension User {
    
    static func login(_ request: UserLoginRequest, handler: @escaping (User?, Error?) -> ()) {
        let service = APIService.login(user: request)
        service.fetch(User.self) { (user, error, _) in
            handler(user, error)
        }
    }
    
    static func register(_ request: UserRegisterRequest, handler: @escaping (User?, Error?) -> ()) {
        let service = APIService.signUp(user: request)
        service.fetch(User.self) { (user, error, _) in
            handler(user, error)
        }
    }
    
    static func getProfile(_ handler: @escaping (User?, Error?) -> ()) {
        let service = APIService.getUserProfile
        service.fetch(User.self) { (user, error, _) in
            handler(user, error)
        }
    }
    
    func update(_ request: UserUpdateRequest, handler: @escaping (User?, Error?) -> ()) {
        let service = APIService.updateUser(request: request)
        service.fetch(User.self) { (user, error, _) in
            handler(user, error)
        }
    }
    
    static func nearbyCoach(_ request: NearbyCoachRequest, handler: @escaping ([User]?, Error?) -> ()) {
        let service = APIService.getNearbyCoaches(request: request)
        service.fetchList(User.self) { (list, error, _) in
            handler(list, error)
        }
    }
    
    func logout(_ handler: @escaping (Bool, Error?)-> ()) {
        let service = APIService.logout
        service.submit { response in
            if response.isSuccess {
                UserManager.shared.deleteActiveUser()
                UserManager.shared.accessToken = nil
            }
            handler(response.isSuccess, response.error)
        }
    }
    
    func changePassword(_ oldPassword: String, _ newPassword: String, _ handler: @escaping (Bool, Error?)-> ()) {
        let service = APIService.changePassword(request: UpdatePasswordRequest(oldPassword: oldPassword, newPassword: newPassword))
        service.submit { response in
            handler(response.isSuccess, response.error)
        }
    }
    
}
