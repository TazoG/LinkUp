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
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else if let user = viewModel.user {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 15) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)

                            VStack(alignment: .leading, spacing: 5) {
                                Text(user.name)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                Text(user.username)
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Text(user.email)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)

                    Divider()

                    Text("Posts by \(user.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)

                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.userPosts) { post in
                            PostRowView(post: post)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
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
