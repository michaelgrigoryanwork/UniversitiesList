//
//  UniversityDTO.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public struct UniversityDTO: Codable {
    public var id: String {
        "\(name)-\(country)"
    }
    
    public let name: String
    public let country: String
    public let alphaTwoCode: String
    public let stateProvince: String?
    public let domains: [String]
    public let webPages: [String]

    enum CodingKeys: String, CodingKey {
        case name, country, domains
        case alphaTwoCode = "alpha_two_code"
        case stateProvince = "state-province"
        case webPages = "web_pages"
    }
}
