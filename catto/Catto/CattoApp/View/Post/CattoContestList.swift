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
                    ForEach(modelData.cattoPost) { catto in
                        CattoPost(cattoPost: modelData.getCattoBinding(for: catto))
                    }
                }
            }

            InputText(text: "Make me laugh ")
                .padding(.bottom, 16)

            Spacer()
        }
        .padding(.horizontal, 16)
        .background(.bgScreen)
        .sheet(isPresented: $modelData.showingProfile) {
            ProfileHost()
                .environment(modelData)
        }
        .onAppear {
            modelData.fetchCattoList()
        }
        .alert("Meeeeeow", isPresented: .constant(modelData.isAlertPresented)) {
            Button("ok") {
                modelData.fetchCattoList()
            }
        } message: {
            Text("We’ve hit a cat-tastrophe! Try again later.")
        }
    }
}
