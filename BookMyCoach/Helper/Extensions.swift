//
//  Extensions.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
