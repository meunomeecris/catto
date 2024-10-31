//
//  CattoContestList.swift
//  Catto
//
//  Created by Cris Messias on 25/10/24.
//

import SwiftUI

struct CattoContestList: View {
    @FocusState private var commentFieldIsFocused: Bool
    @Environment(ModelData.self) var modelData
    var caption: Binding<String>

    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text("Catto")
                        .heading()
                        .bold()
                        .foregroundStyle(.textPrimaryLight)

                    Spacer()

                    NavigationLink {
                        CattoFavoriteListView()
                    } label: {
                        Image("avatarUser")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                            .overlay(content: {
                                Circle()
                                    .stroke(.auxiliarBrand, lineWidth: 2 )
                            })

                    }
                }
                .padding(.horizontal, 16)

                Spacer()

                CattoPostView(cattoPost: modelData.cattoPost[1])

                Spacer()

                HStack {
                    TextField("", text: caption, prompt: Text("Title meow").foregroundStyle(.textCardSecondary))
                        .foregroundStyle(.textButton)
                        .focusable(true)
                        .padding(.horizontal, 16)
                        .padding([.top, .bottom], 14.5)
                        .background(.bgTextField)
                        .clipShape(RoundedRectangle(cornerRadius:16))
                        .autocorrectionDisabled(true)
                        .focused($commentFieldIsFocused)
                        .textInputAutocapitalization(.sentences)
                        .lineLimit(2)

                    Button(action: {
                        
                    }) {
                        Image(systemName: (modelData.cattoPost[1].isFavorite) ? "heart" : "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.auxiliarFavorite)
                            .frame(maxWidth: 24, maxHeight: 24)
                            .padding(10)
                    }
                    .background(.bgButton)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .offset(y: -50)
                .padding(.bottom, -50)
                .padding(.horizontal, 16)
            }
        }
    }
}

