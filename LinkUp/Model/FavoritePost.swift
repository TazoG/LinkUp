//
//  FavoritePost.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 22.09.25.
//

import Foundation
import SwiftData

@Model
final class FavoritePost {
    let userId: Int
    let id: Int
    var title: String
    var body: String
    var isLiked: Bool = false

    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
