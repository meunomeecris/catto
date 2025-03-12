//
//  InputText.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct InputText: View {
    @Environment(ModelData.self) var modelData
    @State private var currentHeight: CGFloat = 0
    @FocusState private var commentFieldIsFocused: Bool

    var body: some View {
        @Bindable var modelData = modelData

        HStack {
            TextField(
                "Make me laugh!",
                text: $modelData.captionInput,
                prompt: Text("Make me laugh!")
                    .foregroundStyle(.textSecondary)
            )
            .miauTextField()
            .focused($commentFieldIsFocused)
            .textInputAutocapitalization(.sentences)
            .submitLabel(.send)
            .onSubmit {
                if !modelData.captionInput.isEmpty {
                    modelData.addCaptionButtonPressed()
                    commentFieldIsFocused = false
                }
            }

            if !modelData.captionInput.isEmpty {
                MiauButtonSend {
                    if !modelData.captionInput.isEmpty {
                        modelData.addCaptionButtonPressed()
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
