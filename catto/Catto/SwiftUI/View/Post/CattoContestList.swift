//
//  CattoContestList.swift
//  Catto
//
//  Created by Cris Messias on 25/10/24.
//

import SwiftUI

struct CattoContestList: View {
    @Environment(ModelData.self) var modelData


    var body: some View {
        @Bindable var modelData = modelData

        NavigationView {
            List {
                HStack {
                    Text("Catto")
                        .heading()
                        .bold()
                        .foregroundStyle(.textPrimaryLight)

                    Spacer()

                    NavigationLink {
                        CattoFavoriteList()
                    } label: {
                        AvatarUser(text: "avatarUser")
                    }
                }
                .padding(.horizontal, 16)

                Spacer()

                ForEach(modelData.cattoPost) { post in
                    CattoPost(cattoPost: post)

                    Spacer()

                    CommentInputBar(catto: post)
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}

struct CommentInputBar: View {
    @Environment(ModelData.self) var modelData
    var catto: Catto

    var cattoIndex: Int {
        modelData.cattoPost.firstIndex(where: { $0.id == catto.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        HStack {
            InputText()
            FavoriteButton(isSet: $modelData.cattoPost[cattoIndex].isFavorite)
        }
    }
}
