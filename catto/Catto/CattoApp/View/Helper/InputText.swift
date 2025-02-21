//
//  InputText.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct InputText: View {
    @State private var currentHeight: CGFloat = 0
    @State var captionInput: String = ""
    @State var text: String
    @FocusState private var commentFieldIsFocused: Bool

    var body: some View {
        HStack {
            TextField(
                "",
                text: $captionInput,
                prompt: Text(text)
                    .foregroundStyle(.textSecondary)
            )
            .miauTextField()
            .focused($commentFieldIsFocused)
            .textInputAutocapitalization(.sentences)
            .submitLabel(.send)
            .onSubmit {
                if !captionInput.isEmpty {
                    commentFieldIsFocused = false
                }
            }

            if !captionInput.isEmpty {
                MiauButtonSend {
                    if !captionInput.isEmpty {
                        commentFieldIsFocused = false
                    }
                }
            }
        }
        .padding(.bottom, currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeInOut, value: 0.16)
    }
}
