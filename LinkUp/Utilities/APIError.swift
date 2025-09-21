//
//  APIError.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return NSLocalizedString("Invalid response from the server", comment: "")
        case .decodingError:
            return NSLocalizedString("Failed to decode the data", comment: "")
        }
    }
}
