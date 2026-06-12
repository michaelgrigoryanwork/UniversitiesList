//
//  PersistenceServiceProtocol.swift
//  PersistenceKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import RealmSwift

public protocol PersistenceServiceProtocol {
    func save<T: Object>(_ objects: [T]) throws
    func fetch<T: Object>(_: T.Type) throws -> [T]
}
