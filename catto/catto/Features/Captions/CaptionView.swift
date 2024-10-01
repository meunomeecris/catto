//
//  Comments.swift
//  catto
//
//  Created by Cris Messias on 20/06/24.
//

import SwiftUI

struct CaptionView: View {
    var body: some View {
        VStack(spacing: 12) {
            MiauCard(username: "@catto", comment: " I will eat all ratatouilles", likes: 13, url: "https://s.yimg.com/ny/api/res/1.2/NV.9pY4aUmqpKFaH8EhyNA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTIwMDA7aD0xNTAw/https://s.yimg.com/os/en_US/News/BGR_News/funny-cat.jpg", isMostVoted: true)
            MiauCard(username: "@kjay", comment: "I AM ON FIRE🔥 ", likes: 0, url: "https://preview.redd.it/19winbuo94t91.jpg?width=3024&format=pjpg&auto=webp&s=86f1f844799004ac6974d35e34a6431a8abb53eb", isMostVoted: false)
            MiauCard(username: "@meunomeecriss", comment: "Destruction mode activated. Let's destroy this world.", likes: 2, url: "https://i.redd.it/wtrh0x9y227d1.png", isMostVoted: false)
        }
    }
}

#Preview {
    CaptionView()
}
