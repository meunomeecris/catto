//
//  InputText.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct InputText: View {
    @FocusState private var commentFieldIsFocused: Bool
    var caption: Binding<String>

    var body: some View {
        TextField(
            "",
            text: caption,
            prompt: Text("Title meow")
                .foregroundStyle(.textCardSecondary)
        )
        .foregroundStyle(.textButton)
        .focusable(true)
        .focused($commentFieldIsFocused)
        .padding(.horizontal, 16)
        .padding([.top, .bottom], 14.5)
        .lineLimit(2)
        .textInputAutocapitalization(.sentences)
        .background(.bgTextField)
        .autocorrectionDisabled(true)
        .clipShape(RoundedRectangle(cornerRadius:16))
    }
}
