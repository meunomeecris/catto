//
//  CattoContestList.swift
//  Catto
//
//  Created by Cris Messias on 25/10/24.
//

import SwiftUI

struct CattoContestList: View {
    @Environment(ModelData.self) var modelData
    var caption: Binding<String>


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
                        CattoFavoriteListView()
                    } label: {
                        AvatarUser(text: "avatarUser")
                    }
                }
                .padding(.horizontal, 16)

                Spacer()

                ForEach(modelData.cattoPost) { post in
                    CattoPostView(cattoPost: post)
                }

                Spacer()

                HStack {
                    InputText(caption: caption)
                    FavoriteButton(isSet: $modelData.cattoPost[0].isFavorite) {
                    }
                }
                .offset(y: -50)
                .padding(.bottom, -60)
                .padding(.horizontal, 16)
            }
        }
    }
}

