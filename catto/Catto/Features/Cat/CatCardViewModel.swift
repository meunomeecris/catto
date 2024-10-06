//
//  CatCardViewModel.swift
//  catto
//
//  Created by Cris Messias on 30/09/24.
//

import Foundation

@Observable
class CatCardViewModel {
    var catUserCase: CatUserCase

    init(catUserCase: CatUserCase) {
        self.catUserCase = catUserCase
    }

    var getAllCats: [CatModel] {
        catUserCase.catModel
    }
}
