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
    
    init(catViewModel: CatViewModel) {
        self.catViewModel = catViewModel
    }

    func getCatImage() -> String {
        guard let catUrl = catViewModel.cats.first?.url else {
            return  "error: \(APIError.invalidURL.localizedDescription)"
        }
        return catUrl
    }
}
