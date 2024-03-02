//
//  Tab.swift
//  HiveV2
//
//  Created by Varun Nair on 3/1/24.
//

import Foundation
import SwiftUI

enum Tab: String, CaseIterable {
    case people = "People"
    case messages = "Messages"
    case events = "Events"
    case profile = "Profile"
    
    var symbol: String {
        switch self {
        case .people:
            "figure.2.arms.open"
        case .messages:
            "message"
        case .events:
            "figure.wave"
        case .profile:
            "person.circle.fill"
        }
    }
}
