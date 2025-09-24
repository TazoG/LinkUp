//
//  LinkUpApp.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import SwiftUI
import SwiftData

@main
struct LinkUpApp: App {

    @StateObject private var themeManager = ThemeManager()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([FavoritePost.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create modelContainer: \(error.localizedDescription)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.currentTheme.colorScheme)
                .modelContainer(sharedModelContainer)
        }
    }
}
