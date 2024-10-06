//
//  MiauCard.swift
//  catto
//
//  Created by Cris Messias on 17/06/24.
//

import SwiftUI

struct MiauCard: View {
    var username: String
    var comment: String
    var likes: Int
    var url: String
    var isMostVoted: Bool

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                AvatarCard(urlImage: url)
                VStack(alignment: .leading, spacing: 4) {
                    Text(username)
                        .label()
                        .foregroundStyle(.textCardPrimary)
                    Text(comment)
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

#Preview {
    VStack(spacing: 16) {
        MiauCard(username: "@meunomeecriss", comment: "Destruction mode activated. Let's destroy this world.", likes: 33, url: "https://i.redd.it/wtrh0x9y227d1.png", isMostVoted: true)

        MiauCard(username: "@kjay", comment: "Let's destroy this world.", likes: 0, url: "https://s.yimg.com/ny/api/res/1.2/NV.9pY4aUmqpKFaH8EhyNA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTIwMDA7aD0xNTAw/https://s.yimg.com/os/en_US/News/BGR_News/funny-cat.jpg", isMostVoted: false)

        MiauCard(username: "@meunomeecriss", comment: "Super power!", likes: 3, url: "https://preview.redd.it/19winbuo94t91.jpg?width=3024&format=pjpg&auto=webp&s=86f1f844799004ac6974d35e34a6431a8abb53eb", isMostVoted: false)
    }
    .padding(16)
}
