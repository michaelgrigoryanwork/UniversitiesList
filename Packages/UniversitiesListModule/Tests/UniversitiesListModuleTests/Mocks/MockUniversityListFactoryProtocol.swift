//
//  MockUniversityListFactoryProtocol.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import UIKit
import CoreDomainKit
import CoreDataKit
@testable import UniversitiesListModule

final class MockUniversitiesListFactory: UniversitiesListFactoryProtocol {
    var capturedUniversity: University?
    
    let stubbedDetailsViewController = UIViewController()
    
    func makeUniversitiesList() -> UIViewController {
        return stubbedDetailsViewController
    }
    
    func makeUniversityDetails(for university: University) -> UIViewController {
        self.capturedUniversity = university
        return stubbedDetailsViewController
    }
}
