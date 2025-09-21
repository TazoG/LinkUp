//
//  MainTabView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 21.09.25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            PostsView()
                .tabItem {
                    Label("Posts", systemImage: "list.bullet")
                }

            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
    }
}

#Preview {
    MainTabView()
}
