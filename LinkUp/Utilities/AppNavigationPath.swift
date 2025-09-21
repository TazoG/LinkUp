//
//  AppNavigationPath.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 29.08.25.
//

import Foundation

enum AppNavigationPath: Hashable {
    case postDetail(Int)
    case userProfile(Int)

    var description: String {
        switch self {
        case .postDetail(let id): return "Post Detail (\(id))"
        case .userProfile(let id): return "User Profile (\(id))"
        }
    }
}
