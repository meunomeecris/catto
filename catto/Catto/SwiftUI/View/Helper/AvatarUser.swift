//
//  AvatarUser.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct AvatarUser: View {
    var text: String


    var body: some View {
        Image(text)
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
