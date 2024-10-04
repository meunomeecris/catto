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
                            CatCardView(viewModel: .constant(CatCardViewModel(catGetUserCase: viewModel.catGetUserCase)))
                            CaptionView()
                                .padding(.top, 16)

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
                TextFieldCaption(viewModel: .constant(CatViewModel(catGetUserCase: viewModel.catGetUserCase)))
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

struct TextFieldCaption: View {
    @Binding var viewModel: CatViewModel
    @FocusState private var miauTextFielIsFocused: Bool

    var body: some View {
        ZStack {
            HStack {
                TextField(text: $viewModel.captionInput, axis: .vertical) {
                    Text("Give me a title")
                        .foregroundStyle(.textSecondary)
                }
                    .miauTextField()
                    .focused($miauTextFielIsFocused)

                if !viewModel.captionInput.isEmpty {
                    Button{
                        viewModel.sendButtonPressed()
                        miauTextFielIsFocused = true
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .font(.title2)
                            .foregroundStyle(.auxiliarBrand)
                    }

                }
            }
            .padding([.trailing, .leading], 16)
        }
    }
}
