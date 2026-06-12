//
//  AppDIContainer.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import UIKit
import SwiftUI
import NetworkKit
import PersistenceKit
import CoreDomainKit
import CoreDataKit
import UniversitiesListModule
import UniversityDetailsModule

final class AppDIContainer {
    private var networkService: NetworkServiceProtocol
    private var persistenceService: PersistenceServiceProtocol
    
    private lazy var universityRepository: UniversityRepositoryProtocol = {
        UniversityRepository(
            networkService: networkService,
            persistenceService: persistenceService
        )
    }()
    
    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        persistenceService: PersistenceServiceProtocol = PersistenceService()
    ) {
        self.networkService = networkService
        self.persistenceService = persistenceService
    }
}

@MainActor
extension AppDIContainer: UniversitiesListFactoryProtocol {
    func makeUniversitiesList() -> UIViewController {
        let router = UniversitiesListRouter(factory: self)
        let interactor = UniversitiesListInteractor(repository: universityRepository)
        let presenter = UniversitiesListPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        let view = UniversitiesListView(presenter: presenter)
        let hostingController = UIHostingController(rootView: view)
        router.viewController = hostingController
        
        return hostingController
    }
    
    func makeUniversityDetails(for university: University) -> UIViewController {
        let router = UniversityDetailsRouter()
        let interactor = UniversityDetailsInteractor(university: university)
        let presenter = UniversityDetailsPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        let view = UniversityDetailsView(presenter: presenter)
        let hostingController = UIHostingController(rootView: view)
        router.viewController = hostingController
        
        return hostingController
    }
}
