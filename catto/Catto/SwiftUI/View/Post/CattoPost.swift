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
    var cattoPost: Catto
    
    var cattoIndex: Int {
        modelData.cattoPost.firstIndex(where: { $0.id == cattoPost.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack(spacing: 24) {
            ZStack(alignment: .topTrailing) {
                CattoImage(
                    cattoPost: cattoPost,
                    widthFrame: .infinity,
                    heightFrame: .infinity,
                    cornerRadius: 16,
                    lineWidth: 8
                )
                
                FavoriteButton(isSet: $modelData.cattoPost[cattoIndex].isFavorite)
                    .padding([.top, .trailing], 16)
            }
            
            if cattoPost.captionList.isEmpty {
                Text("No comments yet!")
                    .heading()
                    .foregroundStyle(.textSecondary)
            } else {
                ForEach(cattoPost.captionList) { caption in
                    MiauCard(username: caption.user.username,
                             avatarUrl: caption.user.userImageUrl,
                             caption: caption.caption,
                             likes: caption.vote,
                             isMostVoted: caption.isMostVoted)
                }
            }
        }
        .padding([.top, .horizontal], 16)
        .padding(.bottom, 24)
        .background(.bgScreen)
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

