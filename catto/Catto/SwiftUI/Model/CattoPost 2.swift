//
//  CattoPost 2.swift
//  Catto
//
//  Created by Cris Messias on 09/02/25.
//


import Foundation

/// SwiftUI Tutorial
struct CattoPost: Hashable, Codable, Identifiable {
    var id: Int
    var catImageUrl: String
    var isFavorite: Bool
    var captionList: [CattoCaption]

    struct CattoCaption: Hashable, Codable , Identifiable {
        var id: Int
        let user: CattoUser
        let caption: String
        let vote: Int
        let isMostVoted: Bool
    }
}