//
//  CattoFavoriteListView.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import SwiftUI

struct CattoFavoriteListView: View {
    var body: some View {
        NavigationSplitView {
            List(cattoPost) { post in
                NavigationLink {
                    CattoPostView(cattoPost: post)
                } label: {
                    CattoFavoriteView(cattoPost: post)
                }
            }
            .navigationTitle("Favorites Catto")
        } detail: {
            Text("Select a Catto")
        }
    }
}
