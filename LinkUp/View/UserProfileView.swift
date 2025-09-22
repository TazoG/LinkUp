//
//  UserProfileView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 29.08.25.
//

import SwiftUI

struct UserProfileView: View {
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
                        Text(user.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(user.username)
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Text(user.email)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom)

                    Divider()

                    Text("Posts by \(user.name)")
                        .font(.title2)
                        .fontWeight(.bold)

                    ForEach(viewModel.userPosts) { post in

                        let temporaryPost = FavoritePost(
                            userId: post.userId,
                            id: post.id,
                            title: post.title,
                            body: post.body
                        )
                        PostRowView(post: temporaryPost)
                    }
                }
            }
            .padding()
            .navigationTitle("Profile")
            .onAppear {
                viewModel.fetchUserProfileData()
            }
        }
    }
}

#Preview {

    let viewModel = UserProfileViewModel(userId: 1)

    return UserProfileView(viewModel: viewModel)
}
