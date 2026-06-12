//
//  UniversitiesListRouter.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import UIKit
import CoreDataKit

public final class UniversitiesListRouter {
    public weak var viewController: UIViewController?
    
    private let factory: UniversitiesListFactoryProtocol
    
    public init(factory: UniversitiesListFactoryProtocol) {
        self.factory = factory
    }
}

extension UniversitiesListRouter: UniversitiesListRouterProtocol {
    public func navigateToDetails(for university: University) {
        let detailsVC = factory.makeUniversityDetails(for: university)
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
