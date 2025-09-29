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
        VStack(alignment: .leading, spacing: 5) {
            Text(comment.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("By: \(comment.email)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(comment.body)
                .font(.body)
                .foregroundColor(.primary)
                .padding(.top, 5)
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
