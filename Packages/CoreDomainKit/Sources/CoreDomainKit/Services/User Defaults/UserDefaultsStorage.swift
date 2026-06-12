//
//  UserDefaultsStorage.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation

public final class UserDefaultsStorage {
    private let defaults: UserDefaults
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    public init(
        defaults: UserDefaults = .standard,
        encoder: JSONEncoder = .init(),
        decoder: JSONDecoder = .init()
    ) {
        self.defaults = defaults
        self.encoder = encoder
        self.decoder = decoder
    }
}

extension UserDefaultsStorage: UserDefaultsStorageProtocol {
    public func save<T: Encodable>(_ value: T, forKey key: StorageKey) {
        do {
            let data = try encoder.encode(value)
            defaults.set(data, forKey: key.rawValue)
        } catch {
            print("❌ Failed to encode storage value for key \(key.rawValue): \(error)")
        }
    }
    
    public func load<T: Decodable>(forKey key: StorageKey) -> T? {
        guard let data = defaults.data(forKey: key.rawValue) else { return nil }
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("❌ Failed to decode storage value for key \(key.rawValue): \(error)")
            return nil
        }
    }
}

public extension UserDefaultsStorage {
    enum StorageKey: String {
        case selectedCountry = "selected_country_preference"
    }
}
