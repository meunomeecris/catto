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
        @Bindable var modelData = modelData

        VStack {
            HStack {
                Text("Catto")
                    .heading()
                    .foregroundStyle(.textPrimaryLight)
                Spacer()
                MiauButtonProfile {
                    modelData.showingProfile.toggle()
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

            InputText(text: "Make me laugh ")
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(.bgScreen)
        .sheet(isPresented: $modelData.showingProfile) {
            ProfileHost()
                .environment(modelData)
        }
    }
}
