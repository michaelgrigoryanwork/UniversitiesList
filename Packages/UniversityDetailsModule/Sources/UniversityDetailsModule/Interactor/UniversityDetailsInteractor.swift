//
//  UniversityDetailsInteractor.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import CoreDataKit

public final class UniversityDetailsInteractor: @unchecked Sendable {
    public weak var presenter: UniversityDetailsInteractorOutputProtocol?
    
    private let university: University
    
    public init(university: University) {
        self.university = university
    }
}

extension UniversityDetailsInteractor: UniversityDetailsInteractorInputProtocol {
    public func loadDetails() async {
        await presenter?.didProvideDetails(university)
    }
}
