//
//  CattoPostView.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoPost: View {
    @Environment(ModelData.self) var modelData
    @State private var offset: CGSize = .zero
    @Binding var cattoPost: Catto

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                ZStack(alignment: .topTrailing) {
                    CattoImage(
                        cattoPost: cattoPost,
                        widthFrame: .infinity,
                        heightFrame: .infinity,
                        cornerRadius: 16,
                        lineWidth: 8
                    )
                    FavoriteButton(isSet: $cattoPost.isFavorite)
                        .padding([.top, .trailing], 16)
                }
                .padding(8)

                if cattoPost.captionList.isEmpty {
                    Text("No comments yet!")
                        .heading()
                        .foregroundStyle(.textSecondary)
                } else {
                    ForEach(cattoPost.captionList, id: \.self) { caption in
                        MiauCard(username: caption.user.username,
                                 avatarUrl: caption.user.userImageUrl,
                                 caption: caption.caption,
                                 likes: caption.vote,
                                 isMostVoted: caption.isMostVoted)
                        .padding(.horizontal, 6)
                    }
                }
            }
        }
        .background(.bgScreen)
        .clipShape(RoundedRectangle(cornerRadius: 16))
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
            modelData.removeCattoFromList()
        case 145...500:
            offset = CGSize(width: 500, height: 0)
            modelData.removeCattoFromList()
        default:
            offset = .zero
        }
    }
}

