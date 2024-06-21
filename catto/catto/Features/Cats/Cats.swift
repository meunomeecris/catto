//
//  Cats.swift
//  catto
//
//  Created by Cris Messias on 20/06/24.
//

import SwiftUI

struct Cats: View {
    @State var viewModel: CatsViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 16) {
                        CatsImage()
                            .padding(.top, 16)
                        Comments()
                    }
                    .padding([.trailing, .leading], 16)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Catto")
                        .heading()
                        .foregroundStyle(.textPrimary)
                }
                ToolbarItem {
                    MiauButtonProfile {
                        viewModel.profileButtonPressed()
                    }
                }
            }
        }
        MiauTextField(
            text: "",
            placehold: "Title me",
            sendButtonAction: {
                viewModel.sendButtonPressed()
            })
        .padding([.trailing, .leading], 16)
    }
}

struct CatsImage: View {
    var body: some View {
        Image("catBilly")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.auxiliarCardCatBoard, lineWidth: 8)
            })
    }
}

#Preview {
    Cats(viewModel: CatsViewModel())
}
