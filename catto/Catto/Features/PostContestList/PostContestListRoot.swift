//
//  PostContestListRoot.swift
//  Catto
//
//  Created by Cris Messias on 23/10/24.
//

import SwiftUI

struct PostContestListRoot: View {
    @State var viewModel: PostContestListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                PostContestListView(viewModel: viewModel)
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
