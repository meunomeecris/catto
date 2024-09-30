//
//  CatCardViewModel.swift
//  catto
//
//  Created by Cris Messias on 30/09/24.
//

import Foundation

@Observable
class CatCardViewModel {
    var catViewModel: CatViewModel
    var isAlertPresented: Bool

    init(catViewModel: CatViewModel, isAlertPresented: Bool = false) {
        self.catViewModel = catViewModel
        self.isAlertPresented = isAlertPresented
    }

    func getCatImage() -> String {
        guard let catUrl = catViewModel.cats.first?.url else {
            isAlertPresented = true
            return "Cat's url not found"
        }
        return catUrl
    }
}
