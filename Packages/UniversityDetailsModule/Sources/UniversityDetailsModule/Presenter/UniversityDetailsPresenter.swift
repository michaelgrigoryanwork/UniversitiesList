//
//  UniversityDetailsPresenter.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import Combine
import CoreDataKit

public final class UniversityDetailsPresenter: ObservableObject {
    @Published public var university: University?
    
    public var interactor: UniversityDetailsInteractorInputProtocol?
    public var router: UniversityDetailsRouterProtocol?
    
    public init(
        university: University? = nil
    ) {
        self.university = university
    }
}

@MainActor
extension UniversityDetailsPresenter: UniversityDetailsInteractorOutputProtocol {
    public func viewDidLoad() {
        Task {
            await interactor?.loadDetails()
        }
    }
    
    public func didProvideDetails(_ university: University) {
        self.university = university
    }
}
