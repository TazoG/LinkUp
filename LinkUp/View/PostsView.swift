//
//  PostsView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import SwiftUI

struct PostsView: View {

    @StateObject private var viewModel = PostsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.posts) {post in
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    PostsView()
}
