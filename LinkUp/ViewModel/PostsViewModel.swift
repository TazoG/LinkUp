//
//  PostsViewModel.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation
import SwiftData

@MainActor
final class PostsViewModel: ObservableObject {
    @Published var displayPosts: [FavoritePost] = []
    @Published var posts: [Post] = []
    @Published var favoritePosts: [FavoritePost] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let apiService: APIServiceProtocol
    private var postService: PostService?

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func configure(with context: ModelContext) {
        self.postService = PostService(modelContext: context)
        self.fetchPosts()
    }

    func fetchPosts() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                guard let postService = self.postService else {
                    return
                }

                let fetchedPosts: [Post] = try await apiService.fetchData(from: .posts)

                postService.saveOrUpdatePosts(fetchedPosts)

                    displayPosts = postService.fetchAllPosts()
                    //                posts = fetchedPosts
                    isLoading = false

            } catch {
                    errorMessage = "Failed to load posts: \(error.localizedDescription)"
                    isLoading = false

            }
        }
    }
}
