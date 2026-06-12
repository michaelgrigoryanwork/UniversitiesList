//
//  MockUniversitiesListInteractor.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import UIKit
import CoreDataKit
import UniversitiesListModule

@MainActor
final class MockUniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    var didCallFetchUniversities = false
    var capturedCountry: Country?
    
    func fetchUniversities(for country: Country, name: String?, page: Int) async {
        didCallFetchUniversities = true
        capturedCountry = country
    }
}
