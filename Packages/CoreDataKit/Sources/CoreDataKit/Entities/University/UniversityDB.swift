//
//  UniversityDB.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import RealmSwift

public class UniversityDB: Object {
    @Persisted(primaryKey: true) public var id: String
    @Persisted public var name: String
    @Persisted public var country: String
    @Persisted public var alphaTwoCode: String
    @Persisted public var stateProvince: String?
    @Persisted public var webPage: String?
    
    public convenience init(dto: UniversityDTO) {
        self.init()
        self.id = dto.id
        self.name = dto.name
        self.country = dto.country
        self.alphaTwoCode = dto.alphaTwoCode
        self.stateProvince = dto.stateProvince
        self.webPage = dto.webPages.first
    }
}
