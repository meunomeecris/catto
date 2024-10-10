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
                        ForEach(viewModel.postList, id: \.self) { eachPost in
                            PostView(post: eachPost)
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

