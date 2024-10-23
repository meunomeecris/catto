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
//    var captionInput: String = ""

    init(getContestList: PostContestListUseCase, post: Post) {
        self.getContestList = getContestList
        self.post = post
    }

//    func addCommentButtonPressed() {
//        createComment()
//        captionInput = ""
//    }
//
//    private func createComment() {
//        getContestList.postUseCase.postList[0].caption.append(
//            CatComments( user:
//                            User(
//                                name: generateRandomName(length: 5),
//                                imageUrl: "https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?q=65&auto=format&w=1600&ar=2:1&fit=crop"
//                            ),
//                         caption: captionInput,
//                         vote: 4
//                       )
//        )
//    }

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
