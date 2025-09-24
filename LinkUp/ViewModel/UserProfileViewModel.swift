//
//  UserProfileViewModel.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 28.08.25.
//

// UserProfileViewModel.swift

import Foundation
import SwiftData

@MainActor
final class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var userPosts: [FavoritePost] = [] // მასივის ტიპი შეიცვალა FavoritePost-ზე
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let userId: Int
    private let apiService: APIServiceProtocol
    private var postService: PostService?

    init(userId: Int, apiService: APIServiceProtocol = APIService()) {
        self.userId = userId
        self.apiService = apiService
    }

    func configure(with context: ModelContext) {
        self.postService = PostService(modelContext: context)
        self.fetchUserProfileData()
    }

    func fetchUserProfileData() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                guard let postService = self.postService else { return }

                let fetchedUser: User = try await apiService.fetchData(from: .user(id: userId))
                let fetchedPosts: [Post] = try await apiService.fetchData(from: .userPosts(userId: userId))

                postService.saveOrUpdatePosts(fetchedPosts)

                user = fetchedUser
                userPosts = postService.fetchUserPostsFromDB(userId: userId)

                isLoading = false
            } catch {
                errorMessage = "Failed to load user profile: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }
}
