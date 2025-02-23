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

    var body: some View {
        @Bindable var cattoState = cattoState

        VStack {
            HStack {
                Text("Catto")
                    .heading()
                    .foregroundStyle(.textPrimaryLight)
                Spacer()
                MiauButtonProfile {
                    cattoState.showingProfile.toggle()
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
        .sheet(isPresented: $cattoState.showingProfile) {
            ProfileHost()
                .environment(modelData)
        }
    }
}
