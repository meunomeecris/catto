//
//  MiauButtons.swift
//  catto
//
//  Created by Cris Messias on 18/06/24.
//

import SwiftUI

struct MiauButtonPrimary: View {
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

struct MiauButtonProfile: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image("avatarUser")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        })
    }
}

struct MiauButtonFavorite: View {
    @Binding var isPressed: Bool
    var action: () -> Void

    var body: some View {
        Button(action: {
            isPressed.toggle()
            action()
        }) {
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

struct MiauButtonNext: View {
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

struct MiauButtonClose: View {
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

struct MiauButtonSend: View {
    var action: () -> Void

    var body: some View {

        Button(action: action) {
            Image(systemName: "paperplane.fill")
                .font(.title2)
                .foregroundStyle(.auxiliarBrand)
        }
        .frame(width: 48, height: 48)
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    VStack {
        HStack {
            MiauButtonPrimary(btnLabel: "Primary", action: {})
            MiauButtonFavorite(isPressed: .constant(true), action: {})
        }
        MiauButtonProfile(action: {})
        MiauButtonPrimary(btnLabel: "Primary", action: {})
        MiauButtonFavorite(isPressed: .constant(true), action: {})
        MiauButtonFavorite(isPressed: .constant(false), action: {})
        MiauButtonNext(action: {})
        MiauButtonClose(action: {})
    }
}
