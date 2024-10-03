//
//  CatCardViewModel.swift
//  catto
//
//  Created by Cris Messias on 30/09/24.
//

import Foundation

@Observable
class CatCardViewModel {
    var catGetUserCase: CatUserCase
    var currentCat: Int = 0

    init(catGetUserCase: CatUserCase) {
        self.catGetUserCase = catGetUserCase
    }

    func getCatImage() -> String {
        if !catGetUserCase.catModel.isEmpty && currentCat < catGetUserCase.catModel.count {
            return catGetUserCase.catModel[currentCat].url
        } else {
            return "Error: Invalid URL"
        }
    }

    func getNextImageButtonPressed() {
        currentCat += 1
    }
}
