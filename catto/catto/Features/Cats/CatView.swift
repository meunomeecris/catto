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
                            ForEach(viewModel.catGetUserCase.cats) { cat in
                                AsyncImage(url: URL(string: cat.url)) { phase in
                                    switch phase {
                                    case .empty:
                                        CatProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .overlay(content: {
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
                                            })
                                            .padding(.top, 16)
                                    case .failure(let error):
                                        Text("Failed to load image")
                                            .foregroundColor(.red)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }

                            }
                                CommentsView()
                            .padding([.trailing, .leading], 16)
                            .padding(.top, 16)
                        }
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
                MiauTextField(
                    text: "",
                    placehold: "Title me",
                    sendButtonAction: {
                        viewModel.sendButtonPressed()
                    })
                .padding([.trailing, .leading], 16)
            }
            .onAppear {
                viewModel.onCatsViewAppear()
            }
        }
    }
}

struct CatProgressView: View {
    var body: some View {
        ProgressView("Psiu, psiu, psiu")
            .foregroundStyle(.textPrimary)
            .frame(minWidth: 350, minHeight: 400)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}

#Preview {
    CatView(viewModel: .constant(CatViewModel(catGetUserCase: CatUserCase())))
}
