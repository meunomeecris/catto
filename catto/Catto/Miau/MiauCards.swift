//
//  MiauCard.swift
//  catto
//
//  Created by Cris Messias on 17/06/24.
//

import SwiftUI

struct MiauCard: View {
    var username: String
    var avatarUrl: String
    var caption: String
    var likes: Int
    var isMostVoted: Bool

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                AvatarCard(urlImage: avatarUrl)
                VStack(alignment: .leading, spacing: 4) {
                    Text(username)
                        .label()
                        .foregroundStyle(.textCardPrimary)
                    Text(caption)
                        .body()
                        .foregroundStyle(.textCardPrimary)
                }
                Spacer()
                VStack {
                    Spacer()
                    if likes == 0 {
                        Image(systemName: "heart")
                            .foregroundStyle(.textCardPrimary)
                            .body()
                            .padding(.bottom, 2)
                    } else {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.auxiliarBlue)
                            .body()
                            .padding(.bottom, 2)
                    }
                    Text(String(likes))
                        .caption()
                        .foregroundStyle(.textCardPrimary)
                    Spacer()
                }
            }
            .padding([.top, .bottom], 12)
            .padding([.trailing, .leading], 16)
        }
        .background(isMostVoted ? Color("bgCardPrimary") : Color("bgCardSecondary"))
        .fixedSize(horizontal: false, vertical: true)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

private struct AvatarCard: View {
    let fixedSize = CGFloat(50)
    var urlImage: String
    var body: some View {
        AsyncImage(url: URL(string: urlImage)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: fixedSize, height: fixedSize)
                    .clipShape(Circle())
            case .failure(_):
                Image(uiImage: .avatarFailed)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: fixedSize, height: fixedSize)
                    .clipShape(Circle())

            default:
                Image(uiImage: .avatarDefault)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: fixedSize, height: fixedSize)
                    .clipShape(Circle())
            }
        }

    }
}
