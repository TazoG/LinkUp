//
//  PostsViewModel.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func fetchPosts() {
        isLoading = true
        
        Task {
            do {
                let fetchedPosts: [Post] = try await apiService.fetchData(from: .posts)
                posts = fetchedPosts
                isLoading = false
            } catch {
                errorMessage = "Failed to load posts: \(error.localizedDescription)"
                isLoading = false
            }
        }
        
    }
}
