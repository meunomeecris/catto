import SwiftUI

struct ImageProgress: View {
    var body: some View {
        ProgressView("Psiu\n Psiu\n Psiu")
            .heading()
            .foregroundStyle(.auxiliarBrand)
            .frame(minWidth: 350, minHeight: 400)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}

