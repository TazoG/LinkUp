//
//  LinkUpApp.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import SwiftUI

@main
struct LinkUpApp: App {

    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.currentTheme.colorScheme)
        }
    }
}
