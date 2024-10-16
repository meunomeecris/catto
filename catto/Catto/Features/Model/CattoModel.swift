//
//  CatModel.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

struct PostContestList {
    let post: [Post]
}

struct Post: Hashable {
    let cat: CatImage
    let caption: [CatComments]
}

struct CatImage: Decodable, Hashable {
    var url: String
}

struct CatComments: Hashable {
    let user: CattoUser
    let vote: Int
    let caption: String
}

struct CattoUser: Hashable{
    let name: String
    let imageUrl: String
}
