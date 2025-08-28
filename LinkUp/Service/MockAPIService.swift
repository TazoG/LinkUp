//
//  MockAPIService.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 28.08.25.
//

import Foundation

class MockAPIService: APIServiceProtocol {
    func fetchData<T: Codable>(from endpoint: APIEndpoint) async throws -> T {
        // აქ შეგიძლია Mock მონაცემების დაბრუნება, მაგალითად:
        // if endpoint == .user(id: 1) { return User(...) as! T }
        // თუ ეს რთული გეჩვენება, შეგიძლია უბრალოდ ცარიელი ობიექტები დააბრუნო.
        throw APIError.invalidResponse // ან დააბრუნე შეცდომა
    }
}
