//
//  UserProfileView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 29.08.25.
//

import SwiftUI
import SwiftData

struct UserProfileView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel: UserProfileViewModel

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else if let user = viewModel.user {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 20) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.blue)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text(user.name)
                                        .font(.title)
                                        .fontWeight(.bold)

                                    Text(user.username)
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                }
                            }

                            Divider()
                                .padding(.horizontal)

                            VStack(alignment: .leading, spacing: 8) {
                                Text("Email: \(user.email)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)

                        if !viewModel.userPosts.isEmpty {
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Posts by \(user.name)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)

                                LazyVStack(spacing: 15) {
                                    ForEach(viewModel.userPosts) { post in
                                        PostRowView(post: post)
                                    }
                                }
                            }
                            .padding()
                        } else {
                            Text("No posts found.")
                                .foregroundColor(.secondary)
                                .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.configure(with: modelContext)
            }
        }
    }
}

#Preview {

    let viewModel = UserProfileViewModel(userId: 1)

    return UserProfileView(viewModel: viewModel)
}
