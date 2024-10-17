//
//  MiauTexfield.swift
//  catto
//
//  Created by Cris Messias on 18/06/24.
//

import SwiftUI


struct MiauTexFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.textPrimaryDark)
            .focusable(true)
            .padding([.top, .bottom], 14.5)
            .padding(.horizontal)
            .background(.auxiliarBrand)
            .clipShape(RoundedRectangle(cornerRadius:16))
            .autocorrectionDisabled(true)
            .lineLimit(2)
    }
}

extension View {
    func miauTextField() -> some View {
        self.modifier(MiauTexFieldModifier())
    }
}
