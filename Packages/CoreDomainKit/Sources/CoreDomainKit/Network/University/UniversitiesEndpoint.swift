//
//  UniversitiesEndpoint.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import NetworkKit

public enum UniversitiesEndpoint: Endpoint {
    case search(country: String, name: String?, limit: Int, offset: Int)
    
    public var baseURL: String {
        return NetworkConstants.baseURL
    }
    
    public var path: String {
        switch self {
        case .search:
            return Path.search.rawValue
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .search(let country, let name, let limit, let offset):
            return [
                URLQueryItem(name: QueryItemKey.country.rawValue, value: country),
                URLQueryItem(name: QueryItemKey.name.rawValue, value: name),
                URLQueryItem(name: QueryItemKey.limit.rawValue, value: String(limit)),
                URLQueryItem(name: QueryItemKey.offset.rawValue, value: String(offset))
            ]
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
}

private extension UniversitiesEndpoint {
    enum QueryItemKey: String {
        case country
        case name
        case limit
        case offset
    }
    
    enum Path: String {
        case search = "/search"
    }
}
