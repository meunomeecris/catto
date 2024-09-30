//
//  CatView.swift
//  catto
//
//  Created by Cris Messias on 20/06/24.
//

import SwiftUI

struct CatView: View {
    @Binding var viewModel: CatViewModel

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ScrollView {
                        VStack(spacing: 16) {
                            CatCardView(viewModel: .constant(CatCardViewModel(catViewModel: viewModel)))
//                            CaptionView()
//                                .padding(.top, 16)
                        }
                        .padding([.trailing, .leading], 16)
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
//                MiauTextField(
//                    text: "",
//                    placehold: "Title me",
//                    sendButtonAction: {
//                        viewModel.sendButtonPressed()
//                    })
//                .padding([.trailing, .leading], 16)
            }
            .onAppear {
                viewModel.onCatsViewAppear()
            }
            .alert("Uh-oh", isPresented: .constant(viewModel.isAlertPresented)) {
                Button("ok") {}
            } message: {
                Text("We’ve hit a cat-tastrophe! Try again later.")
            }
        }
        .padding(.top, 16)
    }
}

#Preview {
    CatView(viewModel: .constant(CatViewModel(catGetUserCase: CatUserCase())))
}
