//
//  UniversityDetailsProtocol.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import CoreDataKit

public protocol UniversityDetailsInteractorInputProtocol: AnyObject, Sendable {
    func loadDetails() async
}

@MainActor
public protocol UniversityDetailsInteractorOutputProtocol: AnyObject {
    func didProvideDetails(_ university: University)
}

@MainActor
public protocol UniversityDetailsRouterProtocol: AnyObject { }
