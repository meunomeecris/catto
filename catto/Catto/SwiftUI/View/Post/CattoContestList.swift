//
//  CattoPostList.swift
//  Catto
//
//  Created by Cris Messias on 25/10/24.
//

import SwiftUI

struct CattoPostList: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(modelData.cattoPost) { post in
                        CattoPost(cattoPost: post)
                    }
                }
            }
            .navigationTitle("Catto")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
        }

    }
}
