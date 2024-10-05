//
//  CatViewModel.swift
//  catto
//
//  Created by Cris Messias on 21/06/24.
//

import Foundation

@Observable
class CatViewModel {
    var catUserCase: CatUserCase
    var isAlertPresented: Bool = false
    var captionInput: String = ""

    init(catUserCase: CatUserCase) {
        self.catUserCase = catUserCase
    }

    func onCatsViewAppear() {
        Task {
            do {
                try await catUserCase.getCats()
            } catch {
                print("Error occurred on getCats:\(error.localizedDescription)")
                isAlertPresented.toggle()
            }
        }
    }

    func sendButtonPressed() {
        addCaption()
        captionInput = ""
    }

    func addCaption() {
        let caption = CaptionModel(user: "@ \(generateRandomName(length: 6))", vote: 0, caption: captionInput)
        catUserCase.catCaptions.append(caption)
        print("caption: \(catUserCase.catCaptions.count)")
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
