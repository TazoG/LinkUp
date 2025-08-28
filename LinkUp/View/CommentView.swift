//
//  CommentView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 28.08.25.
//

import SwiftUI

struct CommentView: View {

    let comment: Comment

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(comment.name)
                .font(.headline)
            Text(comment.body)
                .font(.body)
            Text("By: \(comment.email)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
        let sampleComment = Comment(
            postId: 1,
            id: 1,
            name: "test user",
            email: "test@example.com",
            body: "This is a test comment for the preview."
        )

        return CommentView(comment: sampleComment)
}
