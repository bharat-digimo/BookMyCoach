//
//  APIService+RequestBody.swift
//   BookMyCoach
//
//  Created by Monu Rathor on 21/11/20.
//

import Foundation

extension APIService {
    
    func requestBody() -> DPRequestBody {
        switch self {
        case let .login(user):
            return DPRequestBody(model: user)
        case let .signUp(user):
            return DPRequestBody(model: user)
        case let .updateUser(request):
            return DPRequestBody(model: request)
        case .getUserProfile, .logout:
            return DPRequestBody()
        case let .getNearbyCoaches(request):
            return DPRequestBody(model: request)
        case let .changePassword(request):
            return DPRequestBody(model: request)
        }
    }
    
}
