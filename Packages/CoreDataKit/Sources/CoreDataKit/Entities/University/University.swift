//
//  University.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public struct University: Identifiable, Equatable, Sendable {
    public let id: String
    public let name: String
    public let country: Country
    public let countryCode: String
    public let stateProvince: String
    public let websiteURL: URL?
    
    public var hasStateProvince: Bool {
        return stateProvince != University.notAvailableKey
    }
    
    public init(
        id: String,
        name: String,
        country: Country,
        countryCode: String,
        stateProvince: String?,
        websiteURL: URL?
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.countryCode = countryCode
        self.stateProvince = stateProvince ?? University.notAvailableKey
        self.websiteURL = websiteURL
    }
}

private extension University {
    static let notAvailableKey = "N/A"
}
