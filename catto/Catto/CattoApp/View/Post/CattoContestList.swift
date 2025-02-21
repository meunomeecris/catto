//
//  CattoPostList.swift
//  Catto
//
//  Created by Cris Messias on 25/10/24.
//

import SwiftUI

struct CattoPostList: View {
    @Environment(ModelData.self) var modelData
    @Environment(CattoState.self) var cattoState
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

            InputText(text: "risus")
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(.bgScreen)
        .sheet(isPresented: $showingProfile) {
            ProfileHost()
                .environment(modelData)
        }
        .onAppear {
            if let topPost = modelData.cattoPost.last {
                cattoState.currentID = topPost.id
            }
        }
    }
}
