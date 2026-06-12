//
//  NetworkError.swift
//  NetworkKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case underlying(Error)
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL), (.decodingFailed, .decodingFailed):
            return true
        case (.requestFailed(let a), .requestFailed(let b)):
            return a == b
        default:
            return false
        }
    }
}
