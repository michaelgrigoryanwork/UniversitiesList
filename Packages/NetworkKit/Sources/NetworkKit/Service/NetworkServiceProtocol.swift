//
//  NetworkServiceProtocol.swift
//  NetworkKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}
