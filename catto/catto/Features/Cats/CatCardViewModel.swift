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
    
    var getCatImage: String  {
        catGetUserCase.getImage()
    }

//    func getCatImage() -> String {
//        guard let catUrl = catViewModel.cats.first?.url else {
//            return  "error: \(APIError.invalidURL.localizedDescription)"
//        }
//        return catUrl
//    }
}
