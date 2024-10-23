//
//  PostViewModel.swift
//  Catto
//
//  Created by Cris Messias on 16/10/24.
//

import Foundation
import SwiftUI

@Observable
class PostViewModel {
    var getContestList: PostContestListUseCase
    let post: Post
    var offset: CGSize = .zero

    init(getContestList: PostContestListUseCase, post: Post) {
        self.getContestList = getContestList
        self.post = post
    }

    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-145):
            offset = CGSize(width: -500, height: 0)
            removeCat()
        case 145...500:
            offset = CGSize(width: 500, height: 0)
            removeCat()
        default:
            offset = .zero
        }
    }

    func removeCat() {
        if offset.width <= -500 {
            getContestList.postUseCase.postList.remove(at: 0)
        } else if offset.width >= 500 {
            getContestList.postUseCase.postList.remove(at: 0)
        }
    }


 
}
