//
//  MiauTexfield.swift
//  catto
//
//  Created by Cris Messias on 18/06/24.
//

import SwiftUI

struct MiauTextField: View {
    @State var text: String
    var placehold: String
    var sendButtonAction: () -> Void

    var body: some View {
        ZStack {
            HStack {
                TextField(text: $text, axis: .vertical) {
                    Text(placehold)
                        .foregroundStyle(.textSecondary)
                }
                .autocorrectionDisabled(true)
                .lineLimit(2)
                if !text.isEmpty {
                    Button{
                        sendButtonAction()
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .font(.title3)
                            .foregroundStyle(.auxiliarBrand)
                    }

                }
            }
            .padding([.trailing, .leading], 16)
        }
        .foregroundStyle(.textButton)
        .focusable(true)
        .padding([.top, .bottom], 13)
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius:20))
    }
}

#Preview {
    MiauTextField(text: "", placehold: "@catto", sendButtonAction: {})
        .padding(16)
}
