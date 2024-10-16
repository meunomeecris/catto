//
//  PostContestView.swift
//  Catto
//
//  Created by Cris Messias on 10/10/24.
//

import SwiftUI

struct PostView: View {
    let viewModel: PostViewModel
    @State var offset: CGSize = .zero
    
    var body: some View {
        VStack {
            CatImagesView(urlString: viewModel.post.cat.url)

            if viewModel.post.caption.isEmpty {
                Text("No coments yet!")
                    .heading()
                    .foregroundStyle(.textSecondary)
            } else {
                ForEach(viewModel.post.caption, id: \.self) { eachCaption in
                    MiauCard(
                        username: eachCaption.user.name,
                        avatarUrl: eachCaption.user.imageUrl,
                        caption: eachCaption.caption,
                        likes: eachCaption.vote,
                        isMostVoted: false
                    )
                }
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 60)))
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = value.translation
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
        case -500...(-145):
            offset = CGSize(width: -500, height: 0)
        case 145...500:
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
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
                CatImageProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 440)
                    .background(.bgScreen)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.auxiliarCardCatBoard, lineWidth: 8)
                    })
            case .failure(_):
                CatImageProgressView()
            @unknown default:
                CatImageProgressView()
            }
        }
    }
}

struct CatImageProgressView: View {
    var body: some View {
        ProgressView("Psiu\n Psiu\n Psiu")
            .heading()
            .foregroundStyle(.auxiliarBrand)
            .frame(minWidth: 350, minHeight: 400)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}
