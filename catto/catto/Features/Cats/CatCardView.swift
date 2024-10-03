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
        VStack(spacing: 24) {
            ZStack {
                ForEach(viewModel.getAllCats, id: \.self) { eachCat in
                    CatImagesView(urlString: eachCat.url)
                }
            }
        }
    }

    struct CatImagesView: View {
        var urlString: String
        @State var offset: CGSize = .zero

        var body: some View {
            AsyncImage(url: URL(string: urlString )) { phase in
                switch phase {
                case .empty:
                    CatProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 500)
                        .background(.bgScreen)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.auxiliarCardCatBoard, lineWidth: 8)
                        })
                        .padding(.top, 16)
                case .failure(_):
                    CatProgressView()
                @unknown default:
                    CatProgressView()
                }
            }
            .offset(x: offset.width, y: offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.spring()) {
                            offset = value.translation
                        }
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            swipeCard(width: offset.width)
                        }
                    }
            )
        }

        func swipeCard(width: CGFloat) {
            switch width {
            case -500...(-200):
                offset = CGSize(width: -500, height: 0)
            case 200...500:
                offset = CGSize(width: 500, height: 0)
            default:
                offset = .zero
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
}
