//
//  DataModels.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 27.08.25.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

struct Comment: Codable, Identifiable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
