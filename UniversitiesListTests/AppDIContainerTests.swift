//
//  APPDIContainerTests.swift
//  Universities Browser Tests
//
//  Created by Michael Grigoryan on 12.06.26.
//

import Testing
import UIKit
import SwiftUI

import CoreDomainKit
import CoreDataKit
import NetworkKit
import PersistenceKit
import UniversitiesListModule
import UniversityDetailsModule

@testable import UniversitiesList

@MainActor
struct AppDIContainerTests {
    let sut: AppDIContainer
    
    init() {
        sut = AppDIContainer()
    }

    @Test
    func resolvesUniversitiesListModule() {
        // Given
        let viewController = sut.makeUniversitiesList()
        
        // Verify
        #expect(viewController is UIHostingController<UniversitiesListView>)
    }
    
    @Test
    func resolvesUniversityDetailsModule() {
        // Given
        let dummyUniversity = University.init(
            id: "1",
            name: "University of London",
            country: .unitedKingdom,
            countryCode: "UK",
            stateProvince: "London",
            websiteURL: .init(string: "https://www.example.com")
        )
        
        // When
        let viewController = sut.makeUniversityDetails(for: dummyUniversity)
        
        // Verify
        #expect(viewController is UIHostingController<UniversityDetailsView>)
    }
}
