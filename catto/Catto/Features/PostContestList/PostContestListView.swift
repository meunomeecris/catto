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
    
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    ZStack {

                        ForEach(viewModel.contestList, id: \.self) { eachPost in
                            PostView(viewModel: PostViewModel(post: eachPost))
                        }
                    }
                }
                .padding([.top, .horizontal], 16)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Catto")
                        .heading()
                        .foregroundStyle(.textPrimary)
                }
                ToolbarItem {
                    MiauButtonProfile {
                        viewModel.profileButtonPressed()
                    }
                }
            }
            CommentTextFieldView(viewModel: viewModel)
        }
        .onAppear() {
            viewModel.onViewAppearGetCats()
        }
        .alert("Meeeeeow", isPresented: .constant(viewModel.isAlertPresented)) {
            Button("ok") {}
        } message: {
            Text("We’ve hit a cat-tastrophe! Try again later.")
        }
    }
}

struct CommentTextFieldView: View {
    @State var viewModel: PostContestListViewModel
    @FocusState private var commentFieldIsFocused: Bool

    var body: some View {
        HStack {
            TextField(
                "",
                text: $viewModel.captionInput,
                prompt: Text("Title me if you can")
                    .foregroundStyle(.textSecondary)
            )
            .miauTextField()
            .focused($commentFieldIsFocused)
            .textInputAutocapitalization(.sentences)
            .autocorrectionDisabled(true)
            .keyboardType(.alphabet)
            if !viewModel.captionInput.isEmpty {
                MiauButtonSend {
                    viewModel.addCommentButtonPressed()
                    commentFieldIsFocused = false
                }
            }
        }
        .padding([.bottom, .horizontal], 16)
    }
}
