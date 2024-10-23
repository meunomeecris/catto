//
//  PostContestListView.swift
//  Catto
//
//  Created by Cris Messias on 10/10/24.
//

import SwiftUI

struct PostContestListView: View {
    @State var viewModel: PostContestListViewModel

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Catto")
                        .heading()
                        .foregroundStyle(.textPrimaryLight)
                    Spacer()
                    MiauButtonProfile {
                        viewModel.profileButtonPressed()
                    }
                }
                .padding([.horizontal, .top], 16)
                Spacer()
                VStack {
                    ZStack {
                        ForEach(viewModel.contestList, id: \.self) { eachPost in
                            PostView(viewModel: PostViewModel(getContestList: viewModel.getContestList, post: eachPost))
                        }
                    }
                }
                Spacer()
                CommentTextFieldView(viewModel: viewModel, text: "Title me the best you can")
                    .padding([.horizontal, .top, .bottom], 16)
            }
        }
        .background(.bgScreen)
        .ignoresSafeArea()
        .onAppear() {
            viewModel.onViewAppearGetCats()
        }
        .alert("Meeeeeow", isPresented: .constant(viewModel.isAlertPresented)) {
            Button("ok") {
                viewModel.onViewAppearGetCats()
            }
        } message: {
            Text("We’ve hit a cat-tastrophe! Try again later.")
        }
    }
}

struct CommentTextFieldView: View {
    @State var viewModel: PostContestListViewModel
    @State var text: String
    @FocusState private var commentFieldIsFocused: Bool

    var body: some View {
        HStack {
            TextField(
                "",
                text: $viewModel.captionInput,
                prompt: Text(text)
                    .foregroundStyle(.textSecondary)
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
            if !viewModel.captionInput.isEmpty {
                MiauButtonSend {
                    if !viewModel.captionInput.isEmpty {
                        viewModel.addCommentButtonPressed()
                        commentFieldIsFocused = false
                    }
                }
            }
        }
    }
}



