//
//  CattoFavoriteList.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoFavoriteList: View {
    @Environment(ModelData.self) var modelData

    var filteredCats: [CattoPost] {
        modelData.cattoPost.filter { post in
            post.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            List(filteredCats) { post in
                NavigationLink {
                    CattoPostView(cattoPost: post)
                } label: {
                    CattoFavoriteView(cattoPost: post)
                }
            }
            .navigationTitle("My Cattos")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            Text("Select a Catto")
        }
    }
}
