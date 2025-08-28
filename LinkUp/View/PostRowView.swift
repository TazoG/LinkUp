//
//  PostRowView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 29.08.25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.body)
                .lineLimit(2)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    PostRowView(post: Post(userId: 1, id: 1, title: "PostRowViewTitle", body: "PostRowViewBody"))
}
