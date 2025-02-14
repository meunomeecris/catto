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
                .padding(.horizontal, 16)
                .padding(.top, 24)

                Spacer()

                VStack {
                    ZStack {
                        if viewModel.contestList.isEmpty {
                            CatImageProgressView()
                        } else {
                            ForEach(viewModel.contestList, id: \.self) { eachPost in
                                PostView(viewModel: PostViewModel(getContestList: viewModel.getContestList, post: eachPost))
                            }
                        }
                    }
                }

                Spacer()
                
                CommentTextFieldView(viewModel: viewModel, text: "Title me the best you can")
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
            }
        .background(.bgScreen)
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
        .padding(.bottom, viewModel.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeInOut, value: 0.16)
    }
}



