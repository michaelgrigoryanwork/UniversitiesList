//
//  MockUniversitiesListRouter.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import UIKit
import CoreDataKit
import UniversitiesListModule

@MainActor
final class MockUniversitiesListRouter: UniversitiesListRouterProtocol {
    var capturedRoutedUniversity: University?
    
    func navigateToDetails(for university: University) {
        capturedRoutedUniversity = university
    }
}
