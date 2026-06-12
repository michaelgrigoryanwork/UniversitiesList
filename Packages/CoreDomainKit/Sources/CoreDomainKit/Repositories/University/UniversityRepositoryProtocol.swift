//
//  UniversityRepositoryProtocol.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import CoreDataKit

public protocol UniversityRepositoryProtocol {
    func getUniversities(
        for country: Country,
        name: String?,
        page: Int,
        pageSize: Int
    ) async throws -> (items: [University], hasMore: Bool)
}

public extension UniversityRepositoryProtocol {
    func getUniversities(
        for country: Country,
        name: String?,
        page: Int,
        pageSize: Int = 20
    ) async throws -> (items: [University], hasMore: Bool) {
        try await getUniversities(
            for: country,
            name: name,
            page: page,
            pageSize: pageSize
        )
    }
}
