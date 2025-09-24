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

        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)


            VStack(alignment: .leading, spacing: 5) {
                Text(post.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)


                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            
            Spacer()

            Button {
                withAnimation(.spring()) {
                    post.isLiked.toggle()
                }
            } label: {
                Image(systemName: post.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(post.isLiked ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle())

        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    PostRowView(post: FavoritePost(userId: 1, id: 1, title: "PostRowViewTitle", body: "PostRowViewBody"))
}
