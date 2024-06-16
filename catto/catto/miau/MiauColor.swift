//
//  MiauTheme.swift
//  catto
//
//  Created by Cris Messias on 13/06/24.
//

import SwiftUI


#Preview {
    VStack {
        Text("Text Color")
            .foregroundStyle(.textButton)
        Text("Text Color")
            .foregroundStyle(.textPrimary)
        Text("Text Color")
            .foregroundStyle(.textSecondary)
            .padding(.bottom, 16)
        Text("Background")
            .foregroundStyle(.textButton)
            .padding(20)
            .background(.bgButton)
        Text("Background")
            .foregroundStyle(.textSecondary)
            .padding(20)
            .background(.bgScreen)
        Text("Background")
            .foregroundStyle(.textSecondary)
            .padding(20)
            .background(.bgTextField)
        Text("Background")
            .foregroundStyle(.textPrimary)
            .padding(20)
            .background(.bgCardPrimary)
        Text("Background")
            .foregroundStyle(.textSecondary)
            .padding(20)
            .background(.bgCardSecondary)
            .padding(.bottom, 16)

        Text("Auxiliar Brand")
            .foregroundStyle(.auxiliarBrand)
        Text("Auxiliar Favorite")
            .foregroundStyle(.auxiliarFavorite)
    }
}
