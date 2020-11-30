//
//  APIService.swift
//   BookMyCoach
//
//  Created by Monu Rathor on 21/11/20.
//

import Foundation

enum APIService: DPRequestProtocol {
    
    case login(user: UserLoginRequest)
    case signUp(user: UserRegisterRequest)
    case updateUser(request: UserUpdateRequest)
    case getUserProfile
    case getNearbyCoaches(request: NearbyCoachRequest)
    case logout
    case changePassword(request: UpdatePasswordRequest)
    
    func baseUrl() -> String? {
        return "http://52.66.24.50:5000/api/v1"
    }
    
    func commonHeaders() -> [String: String] {
        var headers: [String: String] = ["apikey": "ISSMLLSHJNDKJKKJN7LKKKJKBJKJNL8UKJB8978676868JHBJBKJBK"]
        if UserManager.shared.isLoggedInUser(), let token = UserManager.shared.accessToken {
            headers["token"] = token
        }
        return headers
    }
    
    func responseKey() -> String? {
        return "data"
    }
    
}
