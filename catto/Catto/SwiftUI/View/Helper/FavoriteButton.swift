//
//  FavoriteButton.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var action: () -> Void
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: (isSet) ? "heart" : "heart.fill")
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
