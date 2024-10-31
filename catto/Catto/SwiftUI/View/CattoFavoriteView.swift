//
//  CattoFavoriteView.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoFavoriteView: View {
    var cattoPost: CattoPost

    var body: some View {
        HStack(spacing: 8) {
            CattoImageView(
                cattoPost: cattoPost,
                widthFrame: 80,
                heightFrame: 100,
                cornerRadius: 8,
                lineWidth: 3
            )
            Text(cattoPost.captionList.first?.caption ?? "")
                .title()
        }
    }
}
