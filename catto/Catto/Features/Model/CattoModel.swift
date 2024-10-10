//
//  CatModel.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

struct PostContestList {
    let post: [PostContest]
}

struct PostContest: Hashable {
    let cat: Cat
    let caption: [Comments]
}

struct Cat: Decodable, Hashable {
    var url: String
}

struct Comments: Hashable {
    let user: User
    let vote: Int
    let caption: String
}

struct User: Hashable{
    let name: String
    let imageUrl: String
}
