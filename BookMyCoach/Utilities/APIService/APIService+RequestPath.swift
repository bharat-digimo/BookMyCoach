//
//  APIService+RequestPath.swift
//   BookMyCoach
//
//  Created by Monu Rathor on 21/11/20.
//

import Foundation

extension APIService {
    
    func requestPath() -> DPRequestPath {
        switch self {
        case .login:
            return DPRequestPath(method: .POST, endPoint: "/user/login")
        case .signUp:
            return DPRequestPath(method: .POST, endPoint: "/user")
        case .updateUser:
            return DPRequestPath(method: .PUT, endPoint: "/user")
        case .getUserProfile:
            return DPRequestPath(method: .GET, endPoint: "/user")
        case .getNearbyCoaches:
            return DPRequestPath(method: .GET, endPoint: "/coach/nearby")
        case .logout:
            return DPRequestPath(method: .DELETE, endPoint: "/user/logout")
        case .changePassword:
            return DPRequestPath(method: .PATCH, endPoint: "/user/changePassword")
        }
    }
    
}
