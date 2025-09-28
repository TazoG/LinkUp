//
//  SettingsView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 21.09.25.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Appearance")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        VStack(spacing: 10) {
                            Text("Theme")
                                .font(.headline)
                                .foregroundColor(.secondary)

                            Picker("Theme", selection: $themeManager.currentTheme) {
                                ForEach(AppTheme.allCases, id: \.self) { theme in
                                    Text(theme.rawValue.capitalized)
                                        .tag(theme)
                                }
                            }
                            .pickerStyle(.segmented)
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
