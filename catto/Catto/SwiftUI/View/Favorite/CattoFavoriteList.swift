//
//  CattoFavoriteList.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoFavoriteList: View {
    @Environment(ModelData.self) var modelData
//    @State private var showFavoritesOnly = false

    var filteredCatto: [Catto] {
        modelData.cattoPost.filter { post in
            post.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            List(filteredCatto) { post in
                NavigationLink {
                    CattoPost(cattoPost: post)
                } label: {
                    CattoFavorite(cattoPost: post)
                }
            }
            .navigationTitle("My Cattos")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            Text("Select a Catto")
        }
    }
}
