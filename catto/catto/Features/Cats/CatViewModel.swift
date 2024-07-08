//
//  CatViewModel.swift
//  catto
//
//  Created by Cris Messias on 21/06/24.
//

import Foundation

@Observable
class CatViewModel {
    var catGetUserCase: CatUserCase

    init(catGetUserCase: CatUserCase) {
        self.catGetUserCase = catGetUserCase
    }

    func onCatsViewAppear() {
        Task {
            await catGetUserCase.getCats()
        }
    }

    func profileButtonPressed() {

    }

    func sendButtonPressed() {
    }
}
