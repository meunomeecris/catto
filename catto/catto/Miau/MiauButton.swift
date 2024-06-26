//
//  MiauButtons.swift
//  catto
//
//  Created by Cris Messias on 18/06/24.
//

import SwiftUI

struct MiauPrimaryButton: View {
    var btnLabel: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(btnLabel)
                .bodyButton()
                .foregroundColor(.textButton)
        }
        .padding(EdgeInsets(top: 4, leading: 24, bottom: 4, trailing: 24))
        .background(Color(.bgButton))
        .fixedSize(horizontal: true, vertical: false)
        .clipShape(RoundedRectangle(cornerRadius: 16))

    }
}

struct MiauFavoriteButton: View {
    @State var isPressed: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isPressed ? "heart.fill" : "heart" )
                .resizable()
                .scaledToFit()
                .foregroundStyle(.auxiliarBlue)
                .frame(maxWidth: 24, maxHeight: 24)
                .padding(10)
        }
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct MiauNextButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.right" )
                .resizable()
                .scaledToFit()
                .foregroundStyle(.textButton)
                .frame(width: 24, height: 24)
                .padding(10)
        }
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct MiauCloseButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "x.circle" )
                .resizable()
                .scaledToFit()
                .foregroundStyle(.textButton)
                .frame(width: 24, height: 24)
                .padding(8)
        }
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    VStack {
        HStack {
            MiauPrimaryButton(btnLabel: "Primary", action: {})
            MiauFavoriteButton(isPressed: true, action: {})
        }
        MiauPrimaryButton(btnLabel: "Primary", action: {})
        MiauFavoriteButton(isPressed: true, action: {})
        MiauFavoriteButton(isPressed: false, action: {})
        MiauNextButton(action: {})
        MiauCloseButton(action: {})
    }
}
