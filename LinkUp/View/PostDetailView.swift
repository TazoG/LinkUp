//
//  PostDetailView.swift
//  LinkUp
//
//  Created by Tazo Gigitashvili on 28.08.25.
//

import SwiftUI

struct PostDetailView: View {
    @StateObject var viewModel: PostDetailViewModel
    let onUserTap: (_ userId: Int) -> Void

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if let user = viewModel.user {
                        Button(action: {
                            onUserTap(user.id)
                        }) {
                            HStack(spacing: 15) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.blue)

                                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)

                                    Text(user.email)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
                        }
                        .buttonStyle(.plain)
                    } else {
                        HStack(spacing: 15) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.blue)

                            VStack(alignment: .leading) {
                                Text("Loading user...")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .redacted(reason: .placeholder)
                                Text("loading@email.com")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .redacted(reason: .placeholder)
                            }
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text(viewModel.post.title)
                            .font(.title)
                            .fontWeight(.bold)

                        Text(viewModel.post.body)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)

                    if !viewModel.comments.isEmpty {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Comments")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)

                            ForEach(viewModel.comments) { comment in
                                CommentView(comment: comment)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Post")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {

    let samplePost = FavoritePost(userId: 1, id: 1, title: "sample post title", body: "sample post body for #preview")

    let viewModel = PostDetailViewModel(post: samplePost, apiService: MockAPIService())

    return PostDetailView(viewModel: viewModel, onUserTap: { userId in 

    })
}

