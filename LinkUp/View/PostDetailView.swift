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
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    Text(viewModel.post.title)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(viewModel.post.body)
                        .font(.body)

                    if let user = viewModel.user {
                        VStack(alignment: .leading, spacing: 10) {
                            Divider()

                            Button(action: {
                                onUserTap(user.id)
                            }) {
                                Text("Posted by \(user.name)")
                                    .font(.headline)
                            }
                            .buttonStyle(.plain)

                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Divider()
                        }
                    }

                    if !viewModel.comments.isEmpty {
                        Text("Comments")
                            .font(.title2)
                            .fontWeight(.bold)

                        ForEach(viewModel.comments) { comment in
                            CommentView(comment: comment)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Post Details")
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

#Preview {

    let samplePost = Post(userId: 1, id: 1, title: "sample post title", body: "sample post body for #preview")

    let viewModel = PostDetailViewModel(post: samplePost, apiService: MockAPIService())

    return PostDetailView(viewModel: viewModel, onUserTap: { userId in 

    })
}

