//
//  FavoriteList.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct FavoriteList: View {
    @Environment(ModelData.self) var modelData

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
                    FavoriteItem(cattoPost: post)
                }
            }
            .navigationTitle("My Cattos")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            Text("Select a Catto")
        }
    }
}
