//
//  PostViewModel.swift
//  Catto
//
//  Created by Cris Messias on 16/10/24.
//

import Foundation

@Observable
class PostViewModel {
    let post: Post

    init(post: Post) {
        self.post = post
    }
}
