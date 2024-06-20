//
//  ContentView.swift
//  catto
//
//  Created by Cris Messias on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            MiauCard(username: "@meunomeecriss", comment: "Destruction mode activated. Let's destroy this world.", likes: 33, url: "https://i.redd.it/wtrh0x9y227d1.png", isMostVoted: true)

            MiauCard(username: "@kjay", comment: "Let's destroy this world.", likes: 0, url: "https://s.yimg.com/ny/api/res/1.2/NV.9pY4aUmqpKFaH8EhyNA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTIwMDA7aD0xNTAw/https://s.yimg.com/os/en_US/News/BGR_News/funny-cat.jpg", isMostVoted: false)

            MiauCard(username: "@meunomeecriss", comment: "Super power!", likes: 3, url: "https://preview.redd.it/19winbuo94t91.jpg?width=3024&format=pjpg&auto=webp&s=86f1f844799004ac6974d35e34a6431a8abb53eb", isMostVoted: false)
        }
        .padding(16)

        HStack {
            MiauTextField(text: "", defaultState: false, sendButtonAction: {})
            MiauNextButton(action: {})
        }
        .padding(16)

        VStack {
            MiauPrimaryButton(btnLabel: "Primary", action: {})
                .padding(.bottom, 16)
            HStack{
                MiauFavoriteButton(isPressed: true, action: {})
                MiauFavoriteButton(isPressed: false, action: {})
                MiauNextButton(action: {})
                MiauCloseButton(action: {})
            }
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
