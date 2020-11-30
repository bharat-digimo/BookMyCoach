//
//  SportViewModel.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/28/20.
//

import Foundation
import SwiftUI

class SportViewModel: ObservableObject, Identifiable {
    
    var sport: Sport
    @Published var isSelected = false
    
    init(sport: Sport) {
        self.sport = sport
    }
    
}
