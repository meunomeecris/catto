//
//  model.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import Foundation

/// SwiftUI Tutorial
struct Catto: Hashable, Codable, Identifiable {
    var id = UUID()
    var catImageUrl: catURL
    var isFavorite: Bool = false
    var captionList: [CattoCaption] = []

    struct CattoCaption: Hashable, Codable , Identifiable {
        var id: Int
        let user: CattoUser
        let caption: String
        let vote: Int
        let isMostVoted: Bool
    }
    
    struct CattoUser: Hashable, Codable {
        var username: String
        var userImageUrl: String
    }
}

struct catURL: Codable, Hashable {
    let url: String
}
