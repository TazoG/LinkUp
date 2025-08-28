//
//  PostDetailViewModel.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

class PostDetailViewModel: ObservableObject {

    @Published var user: User? = nil
    @Published var comments: [Comment] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    let post: Post
    private let apiService: APIServiceProtocol

    init(post: Post, apiService: APIServiceProtocol = APIService()) {
        self.post = post
        self.apiService = apiService
    }

    func fetchData() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let (fetchedUser, fetchedComments): (User, [Comment]) = try await (
                    apiService.fetchData(from: .user(id: post.userId)),
                    apiService.fetchData(from: .comments(postId: post.id))
                )

                user = fetchedUser
                comments = fetchedComments
                isLoading = false
            } catch {
                errorMessage = "Failed to load details: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }
}

