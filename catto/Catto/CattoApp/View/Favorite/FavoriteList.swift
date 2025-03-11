//
//  FavoriteList.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct FavoriteList: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List(modelData.filteredCattos) { catto in
                let post = modelData.getCattoBinding(for: catto)
                NavigationLink {
                    CattoPost(cattoPost: post)
                } label: {
                    FavoriteItem(cattoPost: post.wrappedValue)
                }
            }
            .navigationTitle("My Cattos")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            Text("Select a Catto")
        }
    }
}
