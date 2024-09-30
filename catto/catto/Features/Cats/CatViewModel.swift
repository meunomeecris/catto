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
    var cats: [CatModel] = []

    init(catGetUserCase: CatUserCase) {
        self.catGetUserCase = catGetUserCase
    }

    func onCatsViewAppear() {
        Task {
            do {
             cats = try await catGetUserCase.getCats()
            } catch APIError.invalidURL {
                print("Invalid Url")
            }
        }
    }

    func profileButtonPressed() {

    }

    func sendButtonPressed() {
    }
}
