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
    var caption: [CatComments]
}

struct CatImage: Decodable, Hashable {
    var url: String
}

struct CatComments: Hashable {
    let user: User
    let caption: String
    let vote: Int
}

struct User: Hashable{
    let name: String
    let imageUrl: String
}
