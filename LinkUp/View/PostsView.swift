//
//  PostsView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import SwiftUI

struct PostsView: View {

    @StateObject private var viewModel = PostsViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.posts) { post in
                        NavigationLink(value: AppNavigationPath.postDetail(post.id)) {
                            PostRowView(post: post)

                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.headline)
                                Text(post.body.prefix(100) + "...")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
            .navigationDestination(for: AppNavigationPath.self) { path in
                switch path {
                case .postDetail(let postId):
                    if let post = viewModel.posts.first(where: {$0.id == postId}) {
                        PostDetailView(viewModel: PostDetailViewModel(post: post), onUserTap: { userId in
                            self.path.append(AppNavigationPath.userProfile(userId))
                        })
                    }
                case .userProfile(let userId):
                    UserProfileView(viewModel: UserProfileViewModel(userId: userId))
                }
            }
        }
    }
}

#Preview {
    PostsView()
}
