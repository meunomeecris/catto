//
//  Comments.swift
//  catto
//
//  Created by Cris Messias on 20/06/24.
//

import SwiftUI

struct CaptionView: View {
    @Binding var viewModel: CaptionViewModel

    var body: some View {
        VStack(spacing: 12) {
            if viewModel.getAllCaptions.count == 0 {
                Text("No coments yet!")
                    .heading()
                    .foregroundStyle(.textSecondary)
            } else {
                ForEach(viewModel.getAllCaptions, id:\.self) { eachCaption in

                        MiauCard(
                            username: eachCaption.user,
                            comment: eachCaption.caption,
                            likes: eachCaption.vote,
                            url:"https://preview.redd.it/19winbuo94t91.jpg?width=3024&format=pjpg&auto=webp&s=86f1f844799004ac6974d35e34a6431a8abb53eb",
                            isMostVoted: false
                        )

                }
            }
        }
    }
}
