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
        VStack(spacing: 16) {
            CatImagesView(urlString: viewModel.post.cat.url)
            if viewModel.post.caption.isEmpty {
                CommentTextFieldView(viewModel: viewModel, text: "Title me if you can!")
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
                CommentTextFieldView(viewModel: viewModel, text: "Title me the best you can")
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

struct CommentTextFieldView: View {
    @State var viewModel: PostViewModel
    @State var text: String
    @FocusState private var commentFieldIsFocused: Bool

    var body: some View {
        HStack {
            TextField(
                "",
                text: $viewModel.captionInput,
                prompt: Text(text)
                    .foregroundStyle(.textPrimaryDark)
            )
            .miauTextField()
            .focused($commentFieldIsFocused)
            .textInputAutocapitalization(.sentences)
            .keyboardType(.default)
            .submitLabel(.send)
            .onSubmit {
                if !viewModel.captionInput.isEmpty {
                    viewModel.addCommentButtonPressed()
                    commentFieldIsFocused = false
                }

            }
            MiauButtonSend {
                if !viewModel.captionInput.isEmpty {
                    viewModel.addCommentButtonPressed()
                    commentFieldIsFocused = false
                }
            }
        }
    }
}
