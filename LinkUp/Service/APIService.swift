//
//  APIService.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

class APIService: APIServiceProtocol {

    func fetchData<T>(from endpoint: APIEndpoint) async throws -> T where T : Decodable, T : Encodable {
        let (data, response) = try await URLSession.shared.data(from: endpoint.url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw APIError.decodingError
        }
    }
}
