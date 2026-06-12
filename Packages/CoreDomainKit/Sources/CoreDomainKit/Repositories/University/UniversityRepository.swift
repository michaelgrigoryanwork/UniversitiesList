//
//  UniversityRepository.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import NetworkKit
import PersistenceKit
import CoreDataKit

public final class UniversityRepository {
    private let networkService: NetworkServiceProtocol
    private let persistenceService: PersistenceServiceProtocol
    
    public init(
        networkService: NetworkServiceProtocol,
        persistenceService: PersistenceServiceProtocol
    ) {
        self.networkService = networkService
        self.persistenceService = persistenceService
    }
}

extension UniversityRepository: UniversityRepositoryProtocol {
    public func getUniversities(
        for country: Country,
        name: String?,
        page: Int,
        pageSize: Int
    ) async throws -> (items: [University], hasMore: Bool) {
        let countryString = country.rawValue
        let offset = page * pageSize
        
        do {
            let endpoint = UniversitiesEndpoint.search(
                country: countryString,
                name: name,
                limit: pageSize,
                offset: offset
            )
            let dtos: [UniversityDTO] = try await networkService.request(endpoint: endpoint)
            
            if name == nil || name!.isEmpty {
                let realmModels = dtos.map { UniversityDB(dto: $0) }
                try? persistenceService.save(realmModels)
            }
            
            let domainItems = dtos.compactMap { UniversityDB(dto: $0) }.compactMap { mapToDomain($0) }
            let hasMore = dtos.count == pageSize
            
            return (items: domainItems, hasMore: hasMore)
            
        } catch {
            let cachedModels: [UniversityDB] = (try? persistenceService.fetch(UniversityDB.self)) ?? []
            var filteredModels = cachedModels.filter { $0.country == countryString }
            
            if let searchName = name, !searchName.isEmpty {
                filteredModels = filteredModels.filter {
                    $0.name.localizedCaseInsensitiveContains(searchName)
                }
            }
            
            if filteredModels.isEmpty { throw error }
            
            guard offset < filteredModels.count else { return (items: [], hasMore: false) }
            let endBound = min(offset + pageSize, filteredModels.count)
            let paginatedSlice = Array(filteredModels[offset..<endBound])
            
            let domainItems = paginatedSlice.compactMap { mapToDomain($0) }
            let hasMore = endBound < filteredModels.count
            
            return (items: domainItems, hasMore: hasMore)
        }
    }
}

private extension UniversityRepository {
    func mapToDomain(_ db: UniversityDB) -> University? {
        guard let country = Country(rawValue: db.country) else {
            return nil
        }
        return University(
            id: db.id,
            name: db.name,
            country: country,
            countryCode: db.alphaTwoCode,
            stateProvince: db.stateProvince,
            websiteURL: URL(string: db.webPage ?? "")
        )
    }
}
