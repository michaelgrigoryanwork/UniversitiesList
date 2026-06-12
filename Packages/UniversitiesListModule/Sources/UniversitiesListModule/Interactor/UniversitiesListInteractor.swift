//
//  UniversitiesListInteractor.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import CoreDomainKit
import CoreDataKit

public final class UniversitiesListInteractor: @unchecked Sendable {
    public weak var presenter: UniversitiesListInteractorOutputProtocol?
    
    private let repository: UniversityRepositoryProtocol
    
    public init(repository: UniversityRepositoryProtocol) {
        self.repository = repository
    }
}

extension UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    public func fetchUniversities(
        for country: Country,
        name: String?,
        page: Int
    ) async {
        do {
            let result = try await repository.getUniversities(
                for: country,
                name: name,
                page: page
            )
            await presenter?.didFetchUniversities(result.items, hasMore: result.hasMore)
        } catch {
            await presenter?.didFail(with: error)
        }
    }
}
