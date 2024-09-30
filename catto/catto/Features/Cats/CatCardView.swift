//
//  CatCardView.swift
//  catto
//
//  Created by Cris Messias on 30/09/24.
//

import SwiftUI

struct CatCardView: View {
    @Binding var viewModel: CatCardViewModel

    var body: some View {
            AsyncImage(url: URL(string: viewModel.getCatImage())) { phase in
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
                case .failure(_):
                    CatProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .alert("Uh-oh", isPresented: .constant(viewModel.isAlertPresented)) {
                Button("I get it!", role: .cancel) { }
            } message: {
                Text("We’ve hit a cat-tastrophe! Try again later.")
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
}

#Preview {
    
}
