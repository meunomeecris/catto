//
//  CatPostModel.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

struct CatPostComment {
    let post: Post
    let titles: Array<PostComment>
}

struct PostComment {
    let user: User
    let vote: Int
    let title: String
}

struct Post: Codable, Identifiable {
    let id: String
    let url: String
}

struct User {
    let name: String
    let imageURL: URL?
}
