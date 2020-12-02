//
//  Date+Helper.swift
//  BookMyCoach
//
//  Created by Monu Rathor on 02/12/20.
//

import Foundation

extension Date {
    
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
