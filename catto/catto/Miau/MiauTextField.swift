//
//  MiauTexfield.swift
//  catto
//
//  Created by Cris Messias on 18/06/24.
//

import SwiftUI

struct MiauTextField: View {
    @State var text: String
    var defaultState: Bool
    var sendButtonAction: () -> Void

    var body: some View {
        ZStack {
            HStack {
                TextField(text: $text, axis: .vertical) {
                    Text("@catto")
                        .foregroundStyle(.textSecondary)
                }
                .autocorrectionDisabled(true)
                .lineLimit(2)
                if defaultState == true {
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
        .padding([.top, .bottom], 11)
        .background(.bgButton)
        .clipShape(RoundedRectangle(cornerRadius:16))
    }
}

#Preview {
    VStack {
        MiauTextField(text: "", defaultState: true, sendButtonAction: {})
        MiauTextField(text: "", defaultState: false, sendButtonAction: {})
    }
    .padding(16)
}
