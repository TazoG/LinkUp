//
//  UserProfileViewModel.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 28.08.25.
//

import Foundation

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var userPosts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let userId: Int
    private let apiService: APIServiceProtocol

    init(userId: Int, apiService: APIServiceProtocol = APIService()) {
        self.userId = userId
        self.apiService = apiService
    }

    func fetchUserProfileData() {
        self.isLoading = true
        self.errorMessage = nil

        Task {
            do {
                let (fetchedUser, fetchedPosts): (User, [Post]) = try await (
                    apiService.fetchData(from: .user(id: userId)),
                    apiService.fetchData(from: .userPosts(userId: userId))
                )

                user = fetchedUser
                userPosts = fetchedPosts
                isLoading = false

            } catch {
                errorMessage = "Failed to load user data: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }
}
