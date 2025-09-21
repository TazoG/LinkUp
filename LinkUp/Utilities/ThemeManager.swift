//
//  ThemeManager.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 21.09.25.
//

import SwiftUI

enum AppTheme: String, CaseIterable {
    case light
    case dark

    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

class ThemeManager: ObservableObject {
    @Published var currentTheme: AppTheme {
        didSet {
            UserDefaults.standard.set(currentTheme.rawValue, forKey: "selectedTheme")
        }
    }

    init() {
        if let savedThemeString = UserDefaults.standard.string(forKey: "selectedTheme"),
           let savedTheme = AppTheme(rawValue: savedThemeString) {
            currentTheme = savedTheme
        } else {
            currentTheme = .light
        }
    }
}
