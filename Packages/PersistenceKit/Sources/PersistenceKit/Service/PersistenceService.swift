//
//  PersistenceService.swift
//  PersistenceKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import RealmSwift

public final class PersistenceService: PersistenceServiceProtocol {
    public init() {}
    
    public func save<T: Object>(_ objects: [T]) throws {
        let realm = try Realm()
        try realm.write {
            realm.add(objects, update: .modified)
        }
    }
    
    public func fetch<T: Object>(_: T.Type) throws -> [T] {
        let realm = try Realm()
        return Array(realm.objects(T.self))
    }
}
