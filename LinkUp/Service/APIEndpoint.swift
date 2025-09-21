//
//  APIEndpoint.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

enum APIEndpoint {
    case posts
    case post(id: Int)
    case user(id: Int)
    case comments(postId: Int)
    case userPosts(userId: Int)

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path

        guard let url = components.url else {
            fatalError("Invalid URL for endpoints: \(self)")
        }

        return url
    }

    private var path: String {
        switch self {
        case .posts: return "/posts"
        case .post(let id): return "/posts/\(id)"
        case .user(let id): return "/users/\(id)"
        case .comments(let postId): return "/posts/\(postId)/comments"
        case .userPosts(let userId): return "/users/\(userId)/posts"
        }
    }
}
