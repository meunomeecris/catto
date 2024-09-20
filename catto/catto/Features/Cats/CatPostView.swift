//
//  CatPostView.swift
//  catto
//
//  Created by Cris Messias on 13/09/24.
//

import SwiftUI

struct CatPostView: View {
    @Binding var viewModel: CatPostViewModel
    var cardColor = Color.red

    var body: some View {
        ForEach(viewModel.catGetUserCase.posts, id: \.id) { eachCat in
            AsyncImage(url: URL(string: eachCat.url)) { phase in
                switch phase {
                case .empty:
                    CatProgressView(text: "Psiu, psiu, psiu")
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 500)
                        .background(.bgButton)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.auxiliarCardCatBoard, lineWidth: 8)
                        })
                case .failure(_):
                    CatProgressView(text:"No more proCATStination")
                @unknown default:
                    CatProgressView(text:"Oh no. Where's my cats?! ")
                }
            }
                .offset(x: viewModel.offset.width, y: viewModel.offset.height)
                .rotationEffect(.degrees(Double(viewModel.offset.width / 40)))
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            viewModel.offset = gesture.translation
                        }
                        .onEnded { _ in
                            withAnimation {
                                viewModel.swipeCard(width: viewModel.offset.width)
                            }
                        }
                )
        }
        .padding(.top, 16)
    }
}

struct CatProgressView: View {
    var text: String
    var body: some View {
        ProgressView(text)
            .foregroundStyle(.textPrimary)
            .frame(width: 350, height: 500)
            .background(.auxiliarBrand)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}

#Preview {
    CatPostView(viewModel: .constant(CatPostViewModel(catGetUserCase: CatUserCase(), infoColor: .red)))

}
