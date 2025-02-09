//
//  FavoriteButton.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Image(systemName: isSet ? "heart.fill" : "heart" )
                .resizable()
                .scaledToFit()
                .foregroundStyle(.auxiliarFavorite)
                .frame(maxWidth: 24, maxHeight: 24)
                .padding(10)
        }
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
