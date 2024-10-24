//
//  CattoImageView.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoImageView: View {
    var cattoPost: CattoPost
    var widthFrame: CGFloat
    var heightFrame: CGFloat
    var cornerRadius: CGFloat
    var lineWidth: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: cattoPost.catImageUrl))  { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: widthFrame ,maxHeight: heightFrame)
                    .background(.bgScreen)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(.auxiliarCardCatBoard, lineWidth: lineWidth)
                    })
            case .failure(_):
                ProgressView()
            @unknown default:
                ProgressView()
            }
        }
    }
}
