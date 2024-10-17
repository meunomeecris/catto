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
                ZStack {
                    ForEach(viewModel.contestList, id: \.self) { eachPost in
                        PostView(viewModel: PostViewModel(getContestList: viewModel.getContestList, post: eachPost))
                    }
                }
            }
            .background(.bgScreen)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Catto")
                        .heading()
                        .foregroundStyle(.textPrimaryLight)
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
            Button("ok") {
                viewModel.onViewAppearGetCats()
            }
        } message: {
            Text("We’ve hit a cat-tastrophe! Try again later.")
        }
    }
}

