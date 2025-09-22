//
//  PostRowView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 29.08.25.
//

import SwiftUI
import SwiftData

struct PostRowView: View {
    @Bindable var post: FavoritePost

    var body: some View {

        VStack(alignment: .leading, spacing: 5) {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.body)
                .lineLimit(2)
                .foregroundColor(.secondary)

            Spacer()

            Button {
                withAnimation {
                    post.isLiked.toggle()
                }
            } label: {
                Image(systemName: post.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(post.isLiked ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    PostRowView(post: FavoritePost(userId: 1, id: 1, title: "PostRowViewTitle", body: "PostRowViewBody"))
}
