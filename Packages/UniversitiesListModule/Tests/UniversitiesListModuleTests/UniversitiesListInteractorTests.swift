//
//  UniversitiesListInteractorTests.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import Testing
import CoreDataKit
import CoreDomainKit
@testable import UniversitiesListModule

@MainActor
struct UniversitiesListInteractorTests {
    let sut: UniversitiesListInteractor
    let mockRepository: MockUniversityRepository
    let mockPresenter: MockUniversitiesListPresenter
    
    init() {
        mockRepository = MockUniversityRepository()
        mockPresenter = MockUniversitiesListPresenter()
        
        sut = UniversitiesListInteractor(repository: mockRepository)
        sut.presenter = mockPresenter
    }
    
    @Test
    func fetchUniversitiesSuccess() async {
        // Given
        let university = UniversitiesListInteractorTests.mockUniversity
        mockRepository.resultToReturn = (items: [university], hasMore: false)
        
        // When
        await sut.fetchUniversities(for: .unitedKingdom, name: nil, page: 0)
        
        // Verify
        #expect(mockPresenter.didCallFetchSuccess == true)
        #expect(mockPresenter.capturedUniversities.count == 1)
        #expect(mockPresenter.capturedUniversities.first?.name == university.name)
    }
    
    @Test
    func fetchUniversitiesFailure() async {
        // Given
        mockRepository.errorToThrow = MockError.networkDown
        
        // When
        await sut.fetchUniversities(for: .unitedKingdom, name: nil, page: 0)
        
        // Verify
        #expect(mockPresenter.capturedError != nil)
        #expect(mockPresenter.didCallFetchSuccess == false)
    }
}

private extension UniversitiesListInteractorTests {
    enum MockError: Error {
        case networkDown
    }

    static var mockUniversity: University {
        University.init(
            id: "1",
            name: "University of London",
            country: .unitedKingdom,
            countryCode: "UK",
            stateProvince: "London",
            websiteURL: .init(string: "https://www.example.com")
        )
    }
}
