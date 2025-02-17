//
//  CattoPostList.swift
//  Catto
//
//  Created by Cris Messias on 25/10/24.
//

import SwiftUI

struct CattoPostList: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false

    var body: some View {
        VStack {
            HStack {
                Text("Catto")
                    .heading()
                    .foregroundStyle(.textPrimaryLight)
                Spacer()
                MiauButtonProfile {
                    showingProfile.toggle()
                }
            }

            Spacer()

            VStack {
                ZStack {
                    ForEach(modelData.cattoPost) { post in
                        CattoPost(cattoPost: post)
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(.bgScreen)
        .ignoresSafeArea(edges: .bottom)
        .sheet(isPresented: $showingProfile) {
            ProfileHost()
                .environment(modelData)
        }
    }
}
