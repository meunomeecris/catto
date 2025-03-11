//
//  CattoImage.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoImage: View {
    var cattoPost: Catto
    var widthFrame: CGFloat
    var heightFrame: CGFloat
    var cornerRadius: CGFloat
    var lineWidth: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: cattoPost.catImageUrl.url))  { phase in
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
                CattoProgressView()
            @unknown default:
                CattoProgressView()
            }
        }
    }
}

struct CattoProgressView: View {
    var body: some View {
        ProgressView("Psiu\n Psiu\n Psiu")
            .heading()
            .foregroundStyle(.auxiliarBrand)
            .frame(maxWidth: .infinity ,maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}
