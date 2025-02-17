//
//  PostContestListViewModel.swift
//  Catto
//
//  Created by Cris Messias on 09/10/24.
//

import Foundation
import UIKit

@Observable
class PostContestListViewModel {
    var getContestList: PostContestListUseCase
    var isAlertPresented: Bool = false
    var captionInput: String = ""
    var notificationCenter: NotificationCenter
    var currentHeight: CGFloat = 0


    init(getContestList: PostContestListUseCase, center: NotificationCenter = .default) {
        self.getContestList = getContestList
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }

    func onViewAppearGetCats() {
        Task {
            do {
                try await getContestList.fetchCats()
            } catch {
                print("Error occurred on fetchCats:\(error.localizedDescription)")
                isAlertPresented.toggle()
            }
        }
    }

    var contestList: [Post] {
        getContestList.postUseCase.postList.reversed()
    }

    func addCommentButtonPressed() {
        createComment()
        captionInput = ""
    }

    private func createComment() {
        getContestList.postUseCase.postList[0].caption.append(
            CatComments( user:
                            User(
                                name: generateRandomName(length: 5),
                                imageUrl: "https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?q=65&auto=format&w=1600&ar=2:1&fit=crop"
                            ),
                         caption: captionInput,
                         vote: 4
                       )
        )
    }

    func profileButtonPressed() {

    }


    ///--Mockup names
    func generateRandomName(length: Int) -> String {
        let consonants = "bcdfghjklmnpqrstvwxyz"
        let vowels = "aeiou"
        var name = ""
        var isVowel = Bool.random()

        for _ in 0..<length {
            if isVowel {
                name += String(vowels.randomElement()!)
            } else {
                name += String(consonants.randomElement()!)
            }
            isVowel.toggle()
        }
        return name.capitalized
    }
}
