//
//  UniversitiesListProtocol.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import UIKit
import Foundation
import CoreDataKit

public protocol UniversitiesListInteractorInputProtocol: AnyObject, Sendable {
    func fetchUniversities(for country: Country, name: String?, page: Int) async
}

@MainActor
public protocol UniversitiesListInteractorOutputProtocol: AnyObject {
    func didFetchUniversities(_ newUniversities: [University], hasMore: Bool)
    func didFail(with error: Error)
}

@MainActor
public protocol UniversitiesListRouterProtocol: AnyObject {
    func navigateToDetails(for university: University)
}

@MainActor
public protocol UniversitiesListFactoryProtocol: AnyObject {
    func makeUniversitiesList() -> UIViewController
    func makeUniversityDetails(for university: University) -> UIViewController
}
