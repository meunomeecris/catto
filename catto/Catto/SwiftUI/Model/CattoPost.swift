//
//  model.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import Foundation

/// SwiftUI Tutorial
struct CattoPost: Hashable, Codable, Identifiable {
    var id: Int
    var catImageUrl: String
    var isFavorite: Bool
    var captionList: [CattoCaption]

    struct CattoCaption: Hashable, Codable {
        let user: CattoUser
        let caption: String
        let vote: Int
    }
}

struct CattoUser: Hashable, Codable {
    var username: String
    var userImageUrl: String
}
