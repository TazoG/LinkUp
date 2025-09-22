//
//  Networking.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

protocol APIServiceProtocol {
    func fetchData<T: Codable>(from endpoint: APIEndpoint) async throws -> T
}

//back before swiftdata
