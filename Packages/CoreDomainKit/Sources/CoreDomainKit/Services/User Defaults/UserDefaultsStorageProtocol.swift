//
//  UserDefaultsStorageProtocol.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public protocol UserDefaultsStorageProtocol: AnyObject {
    func save<T: Encodable>(_ value: T, forKey key: UserDefaultsStorage.StorageKey)
    func load<T: Decodable>(forKey key: UserDefaultsStorage.StorageKey) -> T?
}
