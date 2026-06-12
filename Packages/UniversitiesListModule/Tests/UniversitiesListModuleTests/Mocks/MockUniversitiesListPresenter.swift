//
//  MockUniversitiesListPresenter.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import Foundation
import CoreDataKit
import UniversitiesListModule

@MainActor
public final class MockUniversitiesListPresenter: UniversitiesListInteractorOutputProtocol {
    public var capturedUniversities: [University] = []
    public var capturedError: Error?
    public var didCallFetchSuccess = false
    
    public init() {}
    
    public func didFetchUniversities(_ items: [University], hasMore: Bool) {
        self.capturedUniversities = items
        self.didCallFetchSuccess = true
    }
    
    public func didFail(with error: Error) {
        self.capturedError = error
    }
}
