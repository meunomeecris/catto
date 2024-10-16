//
//  PostContestListViewModel.swift
//  Catto
//
//  Created by Cris Messias on 09/10/24.
//

import Foundation

@Observable
class PostContestListViewModel {
    var getContestList: PostContestListUseCase
    var isAlertPresented: Bool = false
    var captionInput: String = ""

    init(postContestListUseCase: PostContestListUseCase) {
        self.getContestList = postContestListUseCase
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
        getContestList.postUseCase.postList
    }

    func addCommentButtonPressed() {
        addCaption()
        captionInput = ""
    }

    func addCaption() {
       
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
