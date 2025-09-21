//
//  MockAPIService.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 28.08.25.
//

import Foundation

class MockAPIService: APIServiceProtocol {
    func fetchData<T: Codable>(from endpoint: APIEndpoint) async throws -> T {

        if T.self == [Post].self {
            let mockPosts = [
                Post(userId: 1, id: 1, title: "Mock Title", body: "Mock Body")
            ]

            return mockPosts as! T
        }

        throw APIError.invalidResponse
    }
}
