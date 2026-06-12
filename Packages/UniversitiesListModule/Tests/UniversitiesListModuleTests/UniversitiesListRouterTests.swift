//
//  UniversitiesListRouterTests.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import Testing
import UIKit
import CoreDomainKit
import CoreDataKit
@testable import UniversitiesListModule

@MainActor
struct UniversitiesListRouterTests {
    let sut: UniversitiesListRouter
    
    let mockFactory: MockUniversitiesListFactory
    let mockNavigationController: MockNavigationController
    let sourceViewController: UIViewController
    
    init() {
        mockFactory = MockUniversitiesListFactory()
        sut = UniversitiesListRouter(factory: mockFactory)
        
        sourceViewController = UIViewController()
        mockNavigationController = MockNavigationController(rootViewController: sourceViewController)
        
        sut.viewController = sourceViewController
    }
    
    func testNavigateToDetails() {
        // Given
        let university = UniversitiesListRouterTests.mockUniversity
        
        // When
        sut.navigateToDetails(for: university)
        
        // Verify
        #expect(mockFactory.capturedUniversity != nil)
        #expect(mockFactory.capturedUniversity?.name == university.name)
        #expect(mockNavigationController.didCallPushViewController == true)
        let pushedVC = mockNavigationController.capturedPushedViewController
        #expect(pushedVC === mockFactory.stubbedDetailsViewController)
    }
}

private extension UniversitiesListRouterTests {
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
