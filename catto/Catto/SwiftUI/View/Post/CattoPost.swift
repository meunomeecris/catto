//
//  CattoPostView.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoPost: View {
    @Environment(ModelData.self) var modelData
    var cattoPost: CattoPost

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                CattoImageView(
                    cattoPost: cattoPost,
                    widthFrame: .infinity,
                    heightFrame: .infinity,
                    cornerRadius: 16,
                    lineWidth: 8
                )


                ForEach(cattoPost.captionList) { caption in
                    MiauCard(username: caption.user.username,
                             avatarUrl: caption.user.userImageUrl,
                             caption: caption.caption,
                             likes: caption.vote,
                             isMostVoted: false)

                }
            }
            .padding(.horizontal, 16)
        }
    }
}

