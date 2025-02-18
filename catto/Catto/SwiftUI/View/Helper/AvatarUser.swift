//
//  AvatarUser.swift
//  Catto
//
//  Created by Cris Messias on 08/02/25.
//

import SwiftUI

struct AvatarUser: View {
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
            case .failure:
                Image(systemName: "avatarDefaultSwiftUI")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
            @unknown default:
                EmptyView()
            }
        }
    }
}
