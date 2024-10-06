//
//  CaptionViewModel.swift
//  catto
//
//  Created by Cris Messias on 04/10/24.
//

import Foundation

@Observable
class CaptionViewModel {
    var catUserCase: CatUserCase

    init(catUserCase: CatUserCase) {
        self.catUserCase = catUserCase
    }

    var getAllCaptions: [CaptionModel] {
        catUserCase.catCaptions
    }
}
