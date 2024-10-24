//
//  CattoPostView.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoPostView: View {
    var cattoPost: CattoPost


    var body: some View {
        VStack(spacing: 8) {
            CattoImageView(cattoPost: cattoPost, widthFrame: .infinity, heightFrame: 440, cornerRadius: 16, lineWidth: 8)
            MiauCard(
                username: caption().user.username,
                avatarUrl: caption().user.userImageUrl,
                caption: caption().caption,
                likes: caption().vote,
                isMostVoted: false
            )
        }
        .padding(.horizontal, 16)
    }

    private func caption() -> CattoPost.CattoCaption {
        if let post = cattoPost.captionList.first {
            return post
        } else {
            return CattoPost.CattoCaption(user: CattoUser(username: "DefaultUser", userImageUrl: ""), caption: "No caption available", vote: 0)
        }
    }
}

