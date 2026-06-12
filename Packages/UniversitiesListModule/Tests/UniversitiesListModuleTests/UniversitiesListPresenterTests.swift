//
//  UniversitiesListPresenterTests.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import Testing
import CoreDomainKit
import CoreDataKit
@testable import UniversitiesListModule

@MainActor
struct UniversitiesListPresenterTests {
    let sut: UniversitiesListPresenter
    
    let mockInteractor: MockUniversitiesListInteractor
    let mockRouter: MockUniversitiesListRouter
    
    init() {
        mockInteractor = MockUniversitiesListInteractor()
        mockRouter = MockUniversitiesListRouter()
        
        sut = UniversitiesListPresenter()
        
        sut.interactor = mockInteractor
        sut.router = mockRouter
    }
        
    @Test
    func testViewDidLoad() async {
        // Given
        sut.fetchData()

        // When
        sut.viewDidLoad()
        
        await Task.yield()
        
        // Verify
        #expect(mockInteractor.didCallFetchUniversities == true)
    }
    
    @Test
    func testDidSelectUniversity() {
        // Given
        let expectedUniversity = UniversitiesListPresenterTests.mockUniversity
        
        // When
        sut.didSelect(university: expectedUniversity)
        
        // Verify
        #expect(mockRouter.capturedRoutedUniversity != nil)
        #expect(mockRouter.capturedRoutedUniversity?.name == expectedUniversity.name)
    }
}

private extension UniversitiesListPresenterTests {
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
