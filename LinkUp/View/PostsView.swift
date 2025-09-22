//
//  PostsView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import SwiftUI
import SwiftData

struct PostsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel = PostsViewModel()
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
                    List {
                        ForEach(viewModel.displayPosts) { post in
                            NavigationLink(value: AppNavigationPath.postDetail(post.id)) {
                                PostRowView(post: post)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
//                viewModel.fetchPosts()
                viewModel.configure(with: modelContext)

            }
            .navigationDestination(for: AppNavigationPath.self) { path in
                switch path {
                case .postDetail(let postId):
                    if let post = viewModel.displayPosts.first(where: {$0.id == postId}) {
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
