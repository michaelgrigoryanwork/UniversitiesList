//
//  Country.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public enum Country: String, CaseIterable, Identifiable, Codable, Sendable {
    public var id: String {
        return rawValue
    }
    
    case unitedArabEmirates = "United Arab Emirates"
    case unitedStates = "United States"
    case unitedKingdom = "United Kingdom"
    case turkiye = "Turkiye"
    
    public var displayName: String {
        return self.rawValue
    }
    
    public var code: String {
        switch self {
        case .unitedArabEmirates:
            return "AE"
        case .unitedStates:
            return "US"
        case .unitedKingdom:
            return "UK"
        case .turkiye:
            return "TR"
        }
    }
    
    public var flag: String {
        switch self {
        case .unitedArabEmirates:
            return "🇦🇪"
        case .unitedStates:
            return "🇺🇸"
        case .unitedKingdom:
            return "🇬🇧"
        case .turkiye:
            return "🇹🇷"
        }
    }
}
