//
//  PostContestView.swift
//  Catto
//
//  Created by Cris Messias on 10/10/24.
//

import SwiftUI

struct PostView: View {
    let viewModel: PostViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 12) {
                CatImagesView(urlString: viewModel.post.cat.url)

                if viewModel.post.caption.isEmpty {
                    Text("No comments yet!")
                        .heading()
                        .foregroundStyle(.textSecondary)
                } else {
                    ForEach(viewModel.post.caption, id: \.self) { eachCaption in
                        MiauCard(
                            username: eachCaption.user.name,
                            avatarUrl: eachCaption.user.imageUrl,
                            caption: eachCaption.caption,
                            likes: eachCaption.vote,
                            isMostVoted: false
                        )
                    }
                }
            }
            .padding([.top, .horizontal], 16)
            .padding(.bottom, 24)
            .background(.bgScreen)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .offset(x: viewModel.offset.width, y: viewModel.offset.height * 0.4)
            .rotationEffect(.degrees(Double(viewModel.offset.width / 60)))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewModel.offset = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            viewModel.swipeCard(width: viewModel.offset.width)
                        }
                    }
            )
        }
    }
}

struct CatImagesView: View {
    var urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString )) { phase in
            switch phase {
            case .empty:
                CatImageProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 440)
                    .background(.bgScreen)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.auxiliarCardCatBoard, lineWidth: 8)
                    })
            case .failure(_):
                CatImageProgressView()
            @unknown default:
                CatImageProgressView()
            }
        }
    }
}

struct CatImageProgressView: View {
    var body: some View {
        ProgressView("Psiu\n Psiu\n Psiu")
            .heading()
            .foregroundStyle(.auxiliarBrand)
            .frame(minWidth: 350, minHeight: 400)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}
