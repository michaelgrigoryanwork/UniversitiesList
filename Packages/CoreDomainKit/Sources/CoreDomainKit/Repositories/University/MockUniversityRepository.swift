//
//  MockUniversityRepository.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import Foundation
import CoreDataKit

public final class MockUniversityRepository: UniversityRepositoryProtocol {
    public var resultToReturn: (items: [University], hasMore: Bool)?
    public var errorToThrow: Error?
    
    public init(
        resultToReturn: (items: [University], hasMore: Bool)? = nil,
        errorToThrow: Error? = nil
    ) {
        self.resultToReturn = resultToReturn
        self.errorToThrow = errorToThrow
    }
    
    public func getUniversities(for country: Country, name: String?, page: Int, pageSize: Int) async throws -> (items: [University], hasMore: Bool) {
        if let errorToThrow {
            throw errorToThrow
        }
        return resultToReturn ?? ([], false)
    }
}
