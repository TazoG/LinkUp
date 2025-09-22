//
//  PostService.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 22.09.25.
//

import Foundation
import SwiftData

class PostService {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // ამოწმებს და ანახლებს პოსტებს
    func saveOrUpdatePosts(_ posts: [Post]) {
        for post in posts {
            if let existingPost = fetchPost(with: post.id) {
                existingPost.title = post.title
                existingPost.body = post.body
            } else {
                let newFavoritePost = FavoritePost(userId: post.userId, id: post.id, title: post.title, body: post.body)
                modelContext.insert(newFavoritePost)
            }
        }
        try? modelContext.save()
    }

    // პოსტის ძებნა dataდან
    func fetchAllPosts() -> [FavoritePost] {
        let fetchDescriptor = FetchDescriptor<FavoritePost>()
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch all posts: \(error)")
            return []
        }
    }

    // პოსტის ძებნა IDით
    private func fetchPost(with id: Int) -> FavoritePost? {
        let predicate = #Predicate<FavoritePost> { $0.id == id }
        let fetchDescriptor = FetchDescriptor<FavoritePost>(predicate: predicate)

        do {
            return try modelContext.fetch(fetchDescriptor).first
        } catch {
            print("Failed to fetch post: \(error)")
            return nil
        }
    }
}
