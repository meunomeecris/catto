//
//  PostContestListViewModel.swift
//  Catto
//
//  Created by Cris Messias on 09/10/24.
//

import Foundation

@Observable
class PostContestListViewModel {
    var postUseCase: PostContestListUseCase
    var isAlertPresented: Bool = false
    var captionInput: String = ""

    init(postUseCase: PostContestListUseCase) {
        self.postUseCase = postUseCase
    }

    func onViewAppearGetCats() {
        Task {
            do {
                try await postUseCase.fetchCats()
            } catch {
                print("Error occurred on fetchCats:\(error.localizedDescription)")
                isAlertPresented.toggle()
            }
        }
    }

    var postList: [PostContest] {
        postUseCase.postContestList
    }

    func sendButtonPressed() {
        addCaption()
        captionInput = ""
    }

    func addCaption() {
       
    }

    func profileButtonPressed() {

    }



    ///-- For fun
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
