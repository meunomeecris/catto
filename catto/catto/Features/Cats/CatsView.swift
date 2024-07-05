//
//  CatsView.swift
//  catto
//
//  Created by Cris Messias on 20/06/24.
//

import SwiftUI

struct CatsView: View {
    @Binding var viewModel: CatsViewModel

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ScrollView {
                        VStack(spacing: 16) {
                            if let image = viewModel.catImage {
                                CatsImage(image: image)
                            } else {
                                CatsProgressView()
                            }
                            CommentsView()
                        }
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

struct CatsImage: View {
    var image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
            .padding(.top, 16)
    }
}

struct CatsProgressView: View {
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
    CatsView(viewModel: .constant(CatsViewModel(catGetUserCase: CatUserCase())))
}
