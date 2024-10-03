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

    init(catGetUserCase: CatUserCase) {
        self.catGetUserCase = catGetUserCase
    }

    var getAllCats: [CatModel] {
        catGetUserCase.catModel
    }
}
